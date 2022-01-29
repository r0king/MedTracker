pragma solidity 0.5.1;

contract MedTracker {
    uint256 public MedCount = 0;
    mapping(uint => Medicine) public drugChain;

    struct Manufacturer{

        address _Address;
        uint _mid;
        string _name;
        string _address;
    } 
    
    Manufacturer man;

    modifier onlyOwner() {
    
        // modifier that makes only the owner of contract to call this function
        require(msg.sender == man._Address);
        // raise error
        _;

    }  

    struct Medicine {
        uint _medid;    // Medicine Id
        uint _bno;      // Batch No:
        string _Name;   // Medicine Name
        string _mName;  // Manufacture Name
        uint _price;    // Price
        string _mDate;  // Manufacturing Date
        string _eDate;  // Expiry DDate 
    }

    constructor() public {
        
       man._Address = msg.sender; // set the address of Manufacturer as the owner of contract
       
    } 

    function addMedicine(
        uint _medid,
        uint _bno,
        string memory _Name ,
        string memory _mName,
        uint _price,
        string memory _mDate,
        string memory _eDate
    )
        public
        onlyOwner
    {
        incrementCount(); 
        drugChain[MedCount] = Medicine(_medid, _bno, _Name, _mName, _price, _mDate, _eDate);
                            // create a new medicine in the array
    }

    function incrementCount() internal {
        MedCount += 1;      // increment medicine count
    }



    function getManufacturer() public view returns(address){
        return man._Address; // get the address of Manufacturer

} 
   
}