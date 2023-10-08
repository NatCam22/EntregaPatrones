//
//  SplashViewModel.swift
//  MVC
//
//  Created by Natalia Hernandez on 7/10/23.
//
//Nota: Profe, si encuentras extraños los comentarios es porque es mi
// forma de tomar notas mientras veo la clase. Y probablemente use
// varios archivos repetidos entre el ejemplo y la práctica
import Foundation


//MARK: - PROTOCOLO
//Aquí meto los métodos que sí quiero que vea la vista.
//Tipo: mira esta es la lista de los métodos que sí puedes usar.
protocol SplashViewModelProtocol{
    func onViewsLoaded()
}



//MARK: - CLASE -
final class SplashViewModel{
    
    private weak var viewDelegate: SplashViewProtocol?
    
    init(viewDelegate: SplashViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)){[weak self] in
            //TODO: Notificar a la vista que navegue al Home
            self?.viewDelegate?.showLoading(false)
            self?.viewDelegate?.navigateToHome()
        }
    }
    
}


//MARK: - EXTENSION -
//Usamos la extensión para establecer el protocolo y declarar las funciones requeridas.
extension SplashViewModel: SplashViewModelProtocol{
    func onViewsLoaded(){
        loadData()
    }
}
