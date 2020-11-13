//
//  Service.swift
//  ImHere
//
//  Created by Nick Fong on 11/9/20.
//

import Firebase

struct Service {
    static func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                
                users.append(user)
                completion(users)
                
                //print("DEBUG: Username is \(user.username)")
                //print("DEBUG: Fullname is \(user.fullname)")
                //print("DEBUG: UID is \(user.uid)")
                
            })
        }
    }
    
    static func fetchOwn(completion: @escaping([User]) -> Void) {
        var own = [User]()
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                
                
                if Auth.auth().currentUser!.uid == user.uid {
                    own.append(user)
                    completion(own)
                }
                
                //print("DEBUG: Username is \(user.username)")
                //print("DEBUG: Fullname is \(user.fullname)")
                //print("DEBUG: UID is \(user.uid)")
                
            })
        }
    }
    
    static func fetchGroups(completion: @escaping([Groups]) -> Void) {
        var groups = [Groups]()
        
        
        var myUserId = Auth.auth().currentUser!.uid;
        var myGroups = Firestore.firestore().collectionGroup("groups").whereField("members." + myUserId, isEqualTo: true);
        
        
        myGroups.getDocuments { (snapshot, error) in
            snapshot?.documents.forEach({ document in
                
                let dictionary = document.data()
                let group = Groups(dictionary: dictionary)
                
                groups.append(group)
                
                
                //print("DEBUG: Username is \(user.username)")
                //print("DEBUG: Fullname is \(user.fullname)")
                //print("DEBUG: UID is \(user.uid)")
                
            })
            completion(groups)
        }
    }
    
    
    
    
}
