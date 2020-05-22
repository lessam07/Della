

import Foundation
import SideMenu

class SideMenu:UITableViewController {
    
   var items = ["Список заказов", "Профиль", "Карта","Мои заказы","Выйти с аккаунта"]
let darkColor = UIColor(red: 82/255, green: 172/255, blue: 170/255, alpha: 1)
override func viewDidLoad() {
    super.viewDidLoad()
    tableView.backgroundColor = darkColor
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
}
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = items[indexPath.row]
    cell.textLabel?.textColor = .white
    cell.backgroundColor = darkColor
    
    
    return cell
}

}
