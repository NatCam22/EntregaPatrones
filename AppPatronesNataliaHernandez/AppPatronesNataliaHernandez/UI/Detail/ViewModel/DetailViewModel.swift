//
//  DetailViewModel.swift
//  MVC
//
//  Created by Natalia Hernandez on 8/10/23.
//

import Foundation

//MARK: - PROTOCOL
protocol DetailViewModelProtocol{
    func onViewsLoaded()
}

//MARK: - CLASE -
final class DetailViewModel{
    
    //Creamos la referencia al delegate del controller de tipo weak para no tener problemas con el amigo ARC
    private weak var viewDelegate: DetailViewProtocol?
    private var viewData: CharacterModel
    
    init(viewDelegate: DetailViewProtocol?, data: CharacterModel){
        self.viewDelegate = viewDelegate
        self.viewData = data
    }
    
    func loadData(){
        //TODO: decirle a la vista que muestre los datos que queremos
        viewDelegate?.updateViews(
            name: viewData.name,
            image: viewData.image,
            job: viewData.job,
            description: viewData.description)
    }
}

//MARK: - EXTENSION -
extension DetailViewModel: DetailViewModelProtocol{
    func onViewsLoaded() {
        loadData()
    }
    
    
}
