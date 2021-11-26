//
//  PostViewController.swift
//  MVP
//
//  Created by Marcos Kilmer Pereira de Aquino on 25/11/21.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    
    private var postPresenter: PostPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postPresenter = PostPresenter(with: self)
    }
    
    @IBAction func resetButtonDidTapped(_ sender: Any) {
        postPresenter?.resetAmount()
    }
    
    @IBAction func buttonDidTapped(_ sender: Any) {
        postPresenter?.callPostService()
    }
    
    
    private func updateLabel() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.amountLabel.text = self.postPresenter?.getPostsAmount()
        }
    }
}

extension PostViewController: PostPresenterView {
    func updateAmountLabel() {
        updateLabel()
    }
    
    func resetAmountLabel() {
        updateLabel()
    }
}
