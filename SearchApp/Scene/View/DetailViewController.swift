//
//  DetailViewController.swift
//  SearchApp
//
//  Created by ismail palali on 16.05.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailViewModel : DetailViewModel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var primaryGenre: UILabel!
    @IBOutlet weak var relaseDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Content Detail"
        view.backgroundColor = GlobalConstants.COLOR_LIGHT_GRAY
        setImageAndLabels()
    }
    
    func convertDateFormat(inputDate: String) -> String{
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: inputDate)!
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func setImageAndLabels(){
    
        imageView.sd_setImage(with: URL(string: detailViewModel.artworkUrl100), placeholderImage: UIImage(named: "placeHolder.png"))
    
        trackName.text = detailViewModel.trackName
        
        let primaryBoldText = "Primary Genre: "
        let primaryAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
        let primaryAttributedString = NSMutableAttributedString(string:primaryBoldText, attributes:primaryAttrs)
        let primaryNormalString = NSMutableAttributedString(string:detailViewModel.primaryGenreName)
        primaryAttributedString.append(primaryNormalString)
        primaryGenre.attributedText = primaryAttributedString
        
        let releaseBoldText = "Release Date : "
        let releaseAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
        let releaseAttributedString = NSMutableAttributedString(string:releaseBoldText, attributes:releaseAttrs)
        let releaseNormalString = NSMutableAttributedString(string:convertDateFormat(inputDate: detailViewModel.releaseDate))
        releaseAttributedString.append(releaseNormalString)
        relaseDate.attributedText = releaseAttributedString
    }
}
