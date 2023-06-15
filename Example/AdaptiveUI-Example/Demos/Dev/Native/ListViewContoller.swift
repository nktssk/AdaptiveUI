//
//  ListViewContoller.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 16.05.2023.
//

import UIKit

final class CatCell: UITableViewCell {
    
    let title = UILabel()
    let subtitle = UILabel()
    let image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        
        title.font = .systemFont(ofSize: 15, weight: .medium)
        subtitle.font = .systemFont(ofSize: 12, weight: .regular)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        image.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        image.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        
        title.topAnchor.constraint(equalTo: self.image.topAnchor, constant: .zero).isActive = true
        title.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 10).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        subtitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: .zero).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: self.image.trailingAnchor, constant: 10).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    func setup(title: String, subtitle: String, image: String) {
        self.title.text = title
        self.subtitle.text = subtitle
        self.image.image = UIImage(named: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class ListViewController: UIViewController, UITableViewDataSource {

    let tableView = UITableView()
    var data = Array(repeating: ("Кот обыкновенный", "Happy Happy Happy Happy", "Boris"), count: 25)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CatCell.self, forCellReuseIdentifier: "CatCell")
        
        data.append(("Last", "Happy Happy Happy Happy", "Boris"))
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.reloadData()
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as? CatCell else { return UITableViewCell() }
        
        cell.setup(title: data[indexPath.row].0, subtitle: data[indexPath.row].1, image: data[indexPath.row].2)
        
        return cell
    }
}
