import UIKit

class PCTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var computer: Computers!{
        didSet{
            self.photoTitleLabel.text = self.computer.status
            //self.photoTitleLabel.setImage(imageUrl: self.computer.ava)
        }
    }
    
}
