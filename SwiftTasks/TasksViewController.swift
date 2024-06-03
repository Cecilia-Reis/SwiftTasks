//
//  TasksViewController.swift
//  SwiftTasks
//
//  Created by Cecilia Reis on 22/05/24.
//

import UIKit

class TasksViewController: UIViewController {
    
    var tasks = ["Fazer tutorial", "fazer trabalho"]
   
    // MARK: - Attributes
    
    private lazy var tasksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 180, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TasksCollectionViewCell.self, forCellWithReuseIdentifier: TasksCollectionViewCell.indentifier)
        collectionView.register(TaksHeader.self,  forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TaksHeader")
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var addTasksHeader: UICollectionReusableView = {
        let header = TaksHeader()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    private lazy var tasksTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TasksTableViewCell.self, forCellReuseIdentifier: TasksTableViewCell.indentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorColor = UIColor.white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
        setupAddSubview()
        setupConstraints()
    }
        
    private func setupNavigationBar() {
        navigationItem.title = "Minhas Tarefas"
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonTapped))
    }
    
    // MARK: - Button Add tasks

    @objc func buttonTapped() {
        let Header = tasksCollectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(item: 0, section: 0)) as! TaksHeader
        
        let task = Header.textField.text
        if let task = task {
            if !task.isEmpty {
                tasks.append(task)
                tasksCollectionView.reloadData()
            }
        }
    }
    
    // MARK: - Add views
    
    private func setupAddSubview() {
        view.addSubview(tasksCollectionView)
        view.addSubview(tasksTableView)
        view.addSubview(addTasksHeader)
    }

    // MARK: - Constraints
    
    private func setupConstraints()  {
        NSLayoutConstraint.activate([
            tasksCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            tasksCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksCollectionView.heightAnchor.constraint(equalToConstant: 200),

            addTasksHeader.topAnchor.constraint(equalTo: tasksCollectionView.bottomAnchor, constant: 20),
            addTasksHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addTasksHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addTasksHeader.heightAnchor.constraint(equalToConstant: 50),

            tasksTableView.topAnchor.constraint(equalTo: addTasksHeader.bottomAnchor, constant: 20),
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
}

// MARK: - Extensions

extension TasksViewController: UICollectionViewDataSource, UICollectionViewDelegate {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TasksCollectionViewCell.indentifier, for: indexPath)
        return cell
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let table = tableView.dequeueReusableCell(withIdentifier: TasksTableViewCell.indentifier, for: indexPath) as! TasksTableViewCell
        table.titleLabel.text = tasks[indexPath.row]
        return table
    }
}

// MARK: - Class do metodo adicionar tarefa

class TaksHeader: UICollectionReusableView {
    
    let textField = UITextField()
    
     lazy var textFieldView: UITextField = {
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
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAddSubview() {
        addSubview(textFieldView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textFieldView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textFieldView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textFieldView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
