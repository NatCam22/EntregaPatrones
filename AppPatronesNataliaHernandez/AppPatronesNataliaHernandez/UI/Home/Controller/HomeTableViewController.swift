//
//  HomeTableViewController.swift
//  MVC
//
//  Created by Natalia Hernandez on 7/10/23.
//

import UIKit
//MARK: -PROTOCOL
protocol HomeViewProtocol: AnyObject{
    func navigateToDetail(with data: CharacterModel?)
    func updateViews()
}


//MARK: -CLASE-
class HomeTableViewController: UITableViewController {
        
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        //La vista no da órdenes al VM. El VM te dice qué tienes que hacer
        //La vista solo informa al VM sobre sus "estados".
        viewModel?.onViewsLoaded()
    }
    
    private func registerCells(){
        tableView.register(
            UINib(nibName: "HomeTableViewCell", bundle: nil),
            forCellReuseIdentifier: HomeTableViewCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.dataCount ?? 0
    }
    override func tableView(
        _ tableView: UITableView, 
        cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.identifier,
            for: indexPath) as? HomeTableViewCell else{
            return UITableViewCell()
        }
        if let data = viewModel?.data(at: indexPath.row){
            cell.updateViews(data: data)
        }
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView, 
        didSelectRowAt indexPath: IndexPath) {
            viewModel?.onItemSelected(at: indexPath.row)
    }
    
}

//MARK: -EXTENSION-
extension HomeTableViewController: HomeViewProtocol{
    func updateViews() {
        tableView.reloadData()
    }
    
    func navigateToDetail(with data: CharacterModel?) {
        let detailVC = DetailViewController()
        detailVC.viewModel = DetailViewModel(viewDelegate: detailVC, data: data!)
        //TODO: inicializar y setear el viewModel de Detail
        
        navigationController?.show(detailVC, sender: nil)
    }
    
}
