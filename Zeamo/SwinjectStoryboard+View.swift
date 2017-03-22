//
//  SwinjectStoryboard+View.swift
//  YoutubeMVVM
//
//  Created by Tran Tuat on 3/6/17.
//  Copyright © 2017 TranTuat. All rights reserved.
//

import Foundation
import MVVMAdditions
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setup() {
        let container = defaultContainer
        container.register(Navigator.self) { _ in
            NavigatorImpl()
            }.inObjectScope(.container)
        
        container.register(MainViewModel.self) { (container)  in
            MainViewModel(navigator: container.resolve(Navigator.self))
        }.inObjectScope(.transient)

        container.storyboardInitCompleted(MainVC.self) { (container, controller) in
            controller.viewModel = container.resolve(MainViewModel.self)
        }

        container.register(CreateAccountViewModel.self) { (container)  in
            CreateAccountViewModel(navigator: container.resolve(Navigator.self))
            }.inObjectScope(.transient)
        
        container.storyboardInitCompleted(CreateAccountVC.self) { (container, controller) in
            controller.viewModel = container.resolve(CreateAccountViewModel.self)
        }
        
        container.register(LoginViewModel.self) { (container)  in
            LoginViewModel(navigator: container.resolve(Navigator.self))
            }.inObjectScope(.transient)
        
        container.storyboardInitCompleted(LoginVC.self) { (container, controller) in
            controller.viewModel = container.resolve(LoginViewModel.self)
        }
        
        container.register(ForgotPasswordViewModel.self) { (container)  in
            ForgotPasswordViewModel(navigator: container.resolve(Navigator.self))
            }.inObjectScope(.transient)
        
        container.storyboardInitCompleted(ForgotPasswordVC.self) { (container, controller) in
            controller.viewModel = container.resolve(ForgotPasswordViewModel.self)
        }
        
        container.register(DetailClassViewModel.self) { (container)  in
            DetailClassViewModel(navigator: container.resolve(Navigator.self))
            }.inObjectScope(.transient)
        
        container.storyboardInitCompleted(DetailClassVC.self) { (container, controller) in
            controller.viewModel = container.resolve(DetailClassViewModel.self)
        }

    }
    
}
