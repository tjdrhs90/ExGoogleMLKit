//
//  ViewController.swift
//  ExGoogleMLKit
//
//  Created by 심성곤 on 10/26/23.
//

import UIKit
import MLKitTranslate

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var koreanEnglishTranslator: Translator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let options = TranslatorOptions(sourceLanguage: .korean, targetLanguage: .english)
        koreanEnglishTranslator = Translator.translator(options: options)
        
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: false, // 셀룰러 허용 여부
            allowsBackgroundDownloading: true // 백그라운드 다운 허용 여부
        )
        
        koreanEnglishTranslator.downloadModelIfNeeded(with: conditions) { error in
            guard error == nil else { return }
            print("언어 모델 다운로드 완료")
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        koreanEnglishTranslator.translate(searchBar.text ?? "") { translatedText, error in
            guard error == nil, let translatedText else { return }
            self.label.text = translatedText
        }
    }
}
