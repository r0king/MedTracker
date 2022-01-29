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
        require(msg.sender == man._Address);
        _;
    }

    struct Medicine {
        uint _medid;
        uint _bno;      // Batch No:
        string _Name;   // Medicine Name
        string _mName;  // Manufacture Name
        uint _price;    // Price
        string _mDate;  // Manufacturing Date
        string _eDate;  // Expiry DDate 
    }

    constructor() public {
        
       man._Address = msg.sender;
       
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
    }

    function incrementCount() internal {
        MedCount += 1;
    }



    function print() public view returns(address){
        return man._Address;

} 
   
}