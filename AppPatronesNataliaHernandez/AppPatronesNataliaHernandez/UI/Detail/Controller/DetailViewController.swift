//
//  DetailViewController.swift
//  MVC
//
//  Created by Natalia Hernandez on 8/10/23.
//

import UIKit

//MARK: - PROTOCOL
protocol DetailViewProtocol: AnyObject{
    func updateViews(name: String?, image: String?, job: String?, description: String?)
}

//MARK: - CLASE -
class DetailViewController: UIViewController {
    
    //MARK: - VIEWMODEL
    var viewModel: DetailViewModelProtocol?
    //MARK: - OUTLETS -
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var charDescription: UILabel!
    @IBOutlet weak var charJob: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.onViewsLoaded()
    }
    
    func update(name: String?){
        charName.text = name ?? ""
    }
    func update(image: String?){
        charImage.image = UIImage(named: image ?? "")
    }
    func update(job: String?){
        charJob.text = job ?? ""
    }
    func update(description: String?){
        charDescription.text = description ?? "" 
    }
}

//MARK: - EXTENSION -
extension DetailViewController: DetailViewProtocol{
    
    func updateViews(name: String?, image: String?, job: String?, description: String?){
        update(name: name)
        update(job: job)
        update(image: image)
        update(description: description)
    }
}
