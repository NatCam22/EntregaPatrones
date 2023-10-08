//
//  HomeViewModel.swift
//  MVC
//
//  Created by Natalia Hernandez on 7/10/23.
//

import Foundation

//MARK: - PROTOCOL
protocol HomeViewModelProtocol{
    var dataCount: Int{
        get
    }
    func onViewsLoaded()
    func data(at index: Int) -> CharacterModel?
    func onItemSelected(at index: Int)
}

//MARK: - CLASE -
final class HomeViewModel{
    private weak var viewDelegate: HomeViewProtocol?
    private var viewData = CharactersModel()
    
    init(viewDelegate: HomeViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData(){
        viewData = sampleCharacterData
        //Decirle a la vista que tome sus datos y que los muestre.
        viewDelegate?.updateViews()
    }
}

//MARK: - EXTENSION -
extension HomeViewModel: HomeViewModelProtocol{
    var dataCount: Int{
        viewData.count
    }
    
    
    func onItemSelected(at index: Int) {
        guard let data = data(at: index) else {return}
        //Notificar a la vista que navegue al detalle con los datos.
        viewDelegate?.navigateToDetail(with: data)
    }
    
    func data(at index: Int) -> CharacterModel? {
        guard index < dataCount else {
            return nil
        }
        return viewData[index]
    }
    
    
    func onViewsLoaded() {
        //Esto es como quien dice:
        //Ahora que me dijeron que la vista ya ha cargado
        //Qué debemos hacer? : en este caso, cargar los datos.
        loadData()
    }
    
    
}
