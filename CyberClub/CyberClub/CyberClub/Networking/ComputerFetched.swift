import Foundation

class ComputerFetcher: ObservableObject {
    @Published var computers = [Computers]()
    @Published var errorMessage: String? = nil
    @Published var isLoaded: Bool = false
    
    init(){
         
    }
    
    func fetchAllComputers(){
        
        isLoaded = true
        
        let url = URL(string: K.URLs.computers)!
        
        _ = URLSession.shared.dataTask(with: url) { [unowned self] data, response, error in
            
            self.isLoaded = false
            let decoder = JSONDecoder()
            
            if let data = data {
                do{
                    let computers = try decoder.decode([Computers].self, from: data)
                    print(computers)
                    self.computers = computers  
                }catch {
                    print(error)
                }
            }
            
        }
    }
}
