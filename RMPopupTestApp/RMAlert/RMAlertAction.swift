
import Foundation

enum RMAlertActionType{
    case normal
    case cancel
}

typealias RMAlertActionHandler = () -> Void

class RMAlertAction{
    
    let title: String
    let type: RMAlertActionType
    let handler: RMAlertActionHandler?
    
    init(title: String, type: RMAlertActionType, handler: RMAlertActionHandler?){
        self.title = title
        self.type = type
        self.handler = handler
    }
    
}
