import UIKit


struct Post:Codable{
    let userId:Int
    let id:Int
    let title: String
    let body: String
}


class ViewController: UITableViewController {
    
    var posts:[Post] = []
    
    func decodeAPI(){
        
        guard let url = URL(string:
        "https://jsonplaceholder.typicode.com/posts")
            else{return}
        let task = URLSession.shared.dataTask(with: url){
            data , response , error in
            
            let decoder = JSONDecoder()
            if let data = data{
                do{
                    self.posts = try decoder.decode([Post].self, from:data)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch{
                    print(error)
                }
            }
        }
        //runs the task
        task.resume()
 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //call as we load the data
        decodeAPI()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].title
        return cell
        
    }
    var selectedRow : Int!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PostViewController {
            if let indexPath = self.tableView.indexPathsForSelectedRows?.first {
                dest.post = posts[indexPath.row]
            }
        }
}
}


    


