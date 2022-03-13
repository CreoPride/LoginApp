//
//  MoreInfoViewController.swift
//  LoginApp
//
//  Created by Konstantin Fomenkov on 12.03.2022.
//

import UIKit

class FotoViewController: UIViewController {

    @IBOutlet weak var fotoView: UIImageView!

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        fotoView.image = UIImage(named: user.person.image)
    }

    

}
