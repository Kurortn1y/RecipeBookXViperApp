//
//  RecipeRouter.swift
//  RecipeBookXViperApp
//
//  Created by Roman Kondrashov on 31.08.24.
//

import SwiftUI

protocol RecipeRouterProtocol {
    associatedtype ContentView: View
    static func createModule() -> ContentView
}

class RecipeRouter: RecipeRouterProtocol {
    static func createModule() -> some View {
        let viewModel = RecipeViewModel()
        let view = RecipeView(viewModel: viewModel)
        let interactor = RecipeInteractor()
        let presenter = RecipePresenter(view: viewModel)
        
        viewModel.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    //Test
    
    
    
}
