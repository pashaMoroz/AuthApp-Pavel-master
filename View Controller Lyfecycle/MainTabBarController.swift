//
//  MainTabBarController.swift
//  View Controller Lyfecycle
//
//  Created by Pavel Moroz on 01.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let searchVC = SearchViewController()
        let profileVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "profileVC") as? ProfileViewController

        let musicImage = UIImage(systemName: "music.house")!
        let personImage = UIImage(systemName: "person.crop.square")!


       // viewControllers = [searchVC,profileVC!]
        viewControllers = [
            generateNavigationController(rootVoewController: searchVC, title: "Музыка", image: musicImage),
            generateNavigationController(rootVoewController: profileVC!, title: "Профиль", image: personImage)
        ]
    }

    func generateNavigationController(rootVoewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootVoewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC

    }


}
