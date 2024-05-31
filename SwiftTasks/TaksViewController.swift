//
//  TaksViewController.swift
//  SwiftTasks
//
//  Created by Cecilia Reis on 22/05/24.
//

import UIKit

class TaksViewController: UIViewController{
    
    var Tasks = ["Fazer tutorial", "fazer trabalho"]
   
// MARK: - Attributes
    
    private lazy var tasksColletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 180, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let colletionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletionView.translatesAutoresizingMaskIntoConstraints = false
        colletionView.dataSource = self
        colletionView.register(TasksCollectionViewCell.self, forCellWithReuseIdentifier: TasksCollectionViewCell.indentifier)
        colletionView.showsHorizontalScrollIndicator = false
        return colletionView
    }()
    
    private lazy var addTasksHeader: UICollectionView = {
        let collectionReuseble = UICollectionView()
        collectionReuseble.register(TaksHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:  "TaksHeader")
        collectionReuseble.translatesAutoresizingMaskIntoConstraints = false
        return collectionReuseble
    }()
    
    private lazy var tasksTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(TaksTableViewCell.self, forCellReuseIdentifier: TaksTableViewCell.indentifier)
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 100
        tableview.separatorColor = UIColor.white
        return tableview
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupAddSubview()
        setupContraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Minhas Tarefas"
    
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(buttonTapped))
    }
    
//MARK: - Button Add tasks

    @objc func buttonTapped() {
        print("Botão Adicionar Tarefa clicado!")
    }
    
// MARK: - Add views
    
    private func setupAddSubview() {
        view.addSubview(tasksColletionView)
        view.addSubview(tasksTableView)
        view.addSubview(addTasksHeader)
        
    }

// MARK: - Contraints
    
    private func setupContraints()  {
        
        NSLayoutConstraint.activate([
            
            tasksColletionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            tasksColletionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksColletionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksColletionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -450),
            
            tasksColletionView.topAnchor.constraint(equalTo: tasksColletionView.bottomAnchor, constant: 40),
            tasksColletionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksColletionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksColletionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
    
}

// MARK: - Extensions

extension TaksViewController: UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TasksCollectionViewCell.indentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let tasksHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader   , withReuseIdentifier: "TaksHeader", for: indexPath) as! TaksHeader
        
        return tasksHeader
    }
}

extension TaksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table = tableView.dequeueReusableCell(withIdentifier: TaksTableViewCell.indentifier, for: indexPath) as! TaksTableViewCell
        
        table.titleLabel.text = Tasks[indexPath.row]
        return table
    }
}

//MARK: - Class do metodo adicionar tarefa

class TaksHeader: UICollectionViewCell {
    
    let textField = UITextField()
    
     lazy var TextField: UITextField = {
        let textField = UITextField()
         textField.font = .systemFont(ofSize: 18.0)
         textField.textColor = .black
         textField.placeholder = "Digite a sua tarefa..."
         textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAddSubview()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddSubview() {
        addSubview(TextField)

    }
    
    private func setupContraints() {
    
        NSLayoutConstraint.activate([
            TextField.bottomAnchor.constraint(equalTo: topAnchor, constant: 30),
            TextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            TextField.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
 
}
