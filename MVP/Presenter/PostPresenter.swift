//
//  PostPresenter.swift
//  MVP
//
//  Created by Marcos Kilmer Pereira de Aquino on 25/11/21.
//

import Foundation

protocol PostPresenterView: AnyObject {
    func updateAmountLabel()
    func resetAmountLabel()
}

class PostPresenter {
    private weak var view: PostPresenterView?
    private let postService = PostService()
    private var amount: Int = 0
    
    init(with view: PostPresenterView) {
        self.view = view
    }
    
    public func getPostsAmount() -> String {
        return String(amount)
    }
    
    public func resetAmount() {
        amount = 0
        view?.resetAmountLabel()
    }
    
    public func callPostService() {
        postService.apiToGetPosts { [weak self] posts, error in
            guard let self = self else { return }
            self.amount = posts?.count ?? 0
            self.view?.updateAmountLabel()
        }
    }
}
