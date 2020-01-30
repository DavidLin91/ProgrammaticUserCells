import UIKit

class ViewController: UIViewController {

   private let userView = UserView()
    
    private var users = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.userView.collectionView.reloadData()
            }
        }
    }
    
    
    override func loadView() {
      view = userView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        userView.collectionView.dataSource = self
        userView.collectionView.delegate = self
        userView.collectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: "userCell")
        fetchUsers()
    }
    
    private func fetchUsers() {
        UsersFetchingService.manager.getUsers { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
            case .success(let users):
                self.users = users
            }
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("could not downcast to user cell")
        }
        cell.backgroundColor = .white
        let user = users[indexPath.row]
        cell.configureCell(user: user)
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // override the default values of the itemSize layout from the collectionVIew property initializer in the PodcastView
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width * 0.95 // 95% of the width of device
        return CGSize(width: itemWidth, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = users[indexPath.row]
    
    // segue to the UserDetailController
    // access the UserDetailController from Storyboard
    
    // make sure that the storyboard id is set for the UserDetailController
        let userDetailStoryboard = UIStoryboard(name: "UserDetail", bundle: nil)
        guard let userDetailController = userDetailStoryboard.instantiateViewController(identifier: "UserDetailVC") as? UserDetailVC else {
            fatalError("Could not downcast to PodcastDetailController")
        }
        userDetailController.user = user
        
        navigationController?.pushViewController(userDetailController, animated: true)
        
    }
}
