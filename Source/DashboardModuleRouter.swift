//
//  DashboardModuleRouter.swift
//  DashboardModule
//
//  Created by Anton Boyarkin on 23/07/2019.
//

import Foundation
import IBACore
import IBACoreUI

public enum DashboardModuleRoute: Route {
    case root
}

public class DashboardModuleRouter: BaseRouter<DashboardModuleRoute> {
    var module: DashboardModule?
    init(with module: DashboardModule) {
        self.module = module
    }

    public override func generateRootViewController() -> BaseViewControllerType {
        return MainViewController(type: module?.config?.type, data: module?.data)
    }

    public override func prepareTransition(for route: DashboardModuleRoute) -> RouteTransition {
        return RouteTransition(module: generateRootViewController(), isAnimated: true, showNavigationBar: false)
    }

    public override func rootTransition() -> RouteTransition {
        return self.prepareTransition(for: .root)
    }
}
