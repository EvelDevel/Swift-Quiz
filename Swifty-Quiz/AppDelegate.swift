
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // TODO: - Additions
    /**
     Отлавливать выход в бэкграунд или перезагрузку девайса - чтобы сохранять последнюю игру. Когда играешь - при перезагрузке не сохраняются данные. 
     
     1. Сделать ползунок с залипанием на "удобное количество вопросов" - 20 / 40 / 60 или вообще сделать 10 / 20 / 30 и так далее. Суть в чем - человеку не всегда удобно играть 60-70 вопросов одной темы, это сложно, но при этом "не доходить до финиша" - может быть не сильно приятным ощущением, которое отталкивает. Нужны маленькие победы каждый раз, чтобы наоборот мотивировать людей не учебу, а тем более если добавить рейтинговую оценочную систему.
     
     Сделать каждую тему "общим котлом", давать играть "удобное количество" каждый раз, все правильные складывать в котел "правильных ответов" - а неправильные возвращать в массив "не пройденных". После чего следующую пачку доставать оттуда. И как только человек ответил правильно на все вопросы - перезаряжать тему, и обнулять этот массив с доступными вопросами.
     
     2. Добавить рейтинговую оценочную систему, добавить общий счет, возможно - элементы геймификации или таблицу "10 лучших" игроков. 
     
     */

	/// For under 13.0
	var window: UIWindow?
	
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

	@available(iOS 13.0, *)
	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

	@available(iOS 13.0, *)
	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

