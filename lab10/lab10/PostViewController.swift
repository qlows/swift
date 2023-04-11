import UIKit

class PostViewController: UIViewController {
    
    // Declare outlets for the labels
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var body: UILabel!
    
    // Declare a Post object to hold the data for this view
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the text of the labels to the data in the Post object
        userId.text = String(post.userId)
        postTitle.text = post.title
        body.text = post.body
    }
}
