//
//  ViewController.swift
//  Lecteur Musique
//
//  Created by Armand Audeoud on 28/01/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playlisteTableView.dequeueReusableCell(withIdentifier: "musiqueCell" , for: indexPath) as! MorceauViewCell
        let row = indexPath.row
        
        if row%2 == 0 {
            cell.backgroundColor = UIColor.systemGray6
        }
        else {
            cell.backgroundColor = UIColor.white
        }
        cell.artisteLabel.text = data[row].artiste
        cell.titreLabel.text = data[row].titre
        
        return cell
    }
    
    
     


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let path = Bundle.main.path(forResource:"Musique", ofType: "json") {
            if let str = try? String(contentsOfFile: path) {
                let rowData = Data(str.utf8)
                if let jsonData = try? JSONDecoder().decode(Playlist.self, from: rowData) {
                    data = jsonData.playlist
                    data.sort{$0.titre < $1.titre}
                    
                    print (data.count)
                    for p in data {
                        print (p.titre)
                    }
                }
                else {
                    errorMsg = "ERROR: no json data!"
                }
            }
            else{
                errorMsg = "ERROR: no txt data"
            }        }
        else {
            errorMsg = "ERROR: File does not exist!"
        }
        if let error = errorMsg {
            print (error)
        }
        
        playlisteTableView.dataSource = self
    }

    @IBOutlet weak var playlisteTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? LecteurViewController {
            let row = playlisteTableView.indexPathForSelectedRow!.row
            viewController.data = data[row]
        }
    }
    
    var data: [Morceau] = []
    var errorMsg: String?

}

