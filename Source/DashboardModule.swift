//
//  DashboardModule.swift
//  DashboardModule
//
//  Created by Anton Boyarkin on 23/07/2019.
//  Copyright © 2019 iBuildApp. All rights reserved.
//

import UIKit
import IBACore
import IBACoreUI

public class DashboardModule: BaseModule, ModuleType {
    public var moduleRouter: AnyRouter { return router }

    private var router: DashboardModuleRouter!
    internal var config: WidgetModel?
    internal var data: DataModel?

    public override class func canHandle(config: WidgetModel) -> Bool {
        return config.type == "dashboard"
    }

    public required init() {
        print("\(type(of: self)).\(#function)")
        super.init()
        router = DashboardModuleRouter(with: self)
    }

    public func setConfig(_ model: WidgetModel) {
        self.config = model
        guard let data = model.data else { return }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
            let decoder = JSONDecoder()
            self.data = try decoder.decode(DataModel.self, from: jsonData)
        } catch {
            print(error)
        }
    }
}
