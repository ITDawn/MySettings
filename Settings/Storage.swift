//
//  Storage.swift
//  Settings
//
//  Created by Dany on 05.11.2021.
//

import Foundation
import UIKit

public var name: String?
public var image = UIImage(named: "3")
public var flight: UIImage?
public var securityImage: UIImage?
public var notificationsImage: UIImage?
public var hiden: Bool?
public var backgroundImage = UIImage(named: "default")
public var cellImage = UIImage(named: "88")
public var labelColor = UIColor.black
public var locationText: String?
public var pickedLanguage: String?

public struct Settings {
    public let label: String
    public let image: UIImage
}

public struct SectionSettings {
    public let settings:[Settings]
}


public struct englishStorage {
    public   static let tableModel = [
        SectionSettings(settings: [
            Settings(label: "Flight mode", image: #imageLiteral(resourceName: "flight")),
            Settings(label: "Username", image: #imageLiteral(resourceName: "username") ),
            Settings(label: "Change avatar", image: #imageLiteral(resourceName: "image")),
            Settings(label: "Content mode", image: #imageLiteral(resourceName: "mode")),
            Settings(label: "Show notifications", image: #imageLiteral(resourceName: "notification")),
            Settings(label: "Date & time", image: #imageLiteral(resourceName: "clock")),
            Settings(label: "Support service", image: #imageLiteral(resourceName: "photo")),
            Settings(label: "Geolocation services", image: #imageLiteral(resourceName: "1")),
            Settings(label: "Language", image: #imageLiteral(resourceName: "31-311873_transparent-languages-icon-png-multiple-language-logo-png")),
            Settings(label: "Security", image: #imageLiteral(resourceName: "ceb8c5e25e4c3e9d_thumb_1200_1200_c100")),
        ])
    ]
}

public struct espanolStorage {
    public   static let tableModel = [
        SectionSettings(settings: [
            Settings(label: "Modo de vuelo", image: #imageLiteral(resourceName: "flight")),
            Settings(label: "Nombre de usuario", image: #imageLiteral(resourceName: "username") ),
            Settings(label: "Cambiar avatar", image: #imageLiteral(resourceName: "image")),
            Settings(label: "Modo de contenido", image: #imageLiteral(resourceName: "mode")),
            Settings(label: "Mostrar notificaciones", image: #imageLiteral(resourceName: "notification")),
            Settings(label: "Fecha y hora", image: #imageLiteral(resourceName: "clock")),
            Settings(label: "Servicio de soporte", image: #imageLiteral(resourceName: "photo")),
            Settings(label: "Servicios de geolocalización", image: #imageLiteral(resourceName: "1")),
            Settings(label: "Idioma", image: #imageLiteral(resourceName: "31-311873_transparent-languages-icon-png-multiple-language-logo-png")),
            Settings(label: "Seguridad", image: #imageLiteral(resourceName: "ceb8c5e25e4c3e9d_thumb_1200_1200_c100")),
        ])
    ]
}

public struct japanStorage {
    public   static let tableModel = [
        SectionSettings(settings: [
            Settings(label: "飛行モード", image: #imageLiteral(resourceName: "flight")),
            Settings(label: "ユーザー名", image: #imageLiteral(resourceName: "username") ),
            Settings(label: "アバターを変更する", image: #imageLiteral(resourceName: "image")),
            Settings(label: "コンテンツモード", image: #imageLiteral(resourceName: "mode")),
            Settings(label: "通知を表示する", image: #imageLiteral(resourceName: "notification")),
            Settings(label: "日時", image: #imageLiteral(resourceName: "clock")),
            Settings(label: "サポートサービス", image: #imageLiteral(resourceName: "photo")),
            Settings(label: "地理位置情報サービス", image: #imageLiteral(resourceName: "1")),
            Settings(label: "言語", image: #imageLiteral(resourceName: "31-311873_transparent-languages-icon-png-multiple-language-logo-png")),
            Settings(label: "セキュリティ", image: #imageLiteral(resourceName: "ceb8c5e25e4c3e9d_thumb_1200_1200_c100")),
        ])
    ]
}

