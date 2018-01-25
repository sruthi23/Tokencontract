pragma solidity ^0.4.18;

import './ERC20.sol';

contract SampleToken is ERC20{
  
  address _owner;
  uint256 public token;
  string public constant name = "Chain Coin";
  string public  constant symbol = "CCT";
  uint8 public constant decimals = 18;
  uint256 public constant total_supply = 1000000  * (1 ether / 1 wei);
  uint256 public total_token;
  
  mapping(address => uint256) public addresslist;
  address[] public addresskey;
  mapping(address => uint256) public balances;
  mapping(address => mapping(address => uint)) allowed;
  
  event Approval(address indexed owner, address indexed spender, uint256 value);

  
  function SampleToken() public {
    totalSupply = total_supply;
    _owner = msg.sender; 
    balances[_owner] = totalSupply;
  }
  
  modifier onlyOwner {
   
    require(msg.sender == _owner);
    _;
  }

  function approve(address _adr, uint256 _token) onlyOwner public returns(bool) {
    
    require(total_token <= total_supply);
    addresslist[_adr] = _token;
    addresskey.push(_adr);
    total_token += _token;
    Approval(_adr,_adr,10);
    return true;
  }

/*function approve(address spender, uint256 _token) public returns(bool) {
          
          allowed[msg.sender][spender] = _token;
          Approval(msg.sender, spender,_token);
          return true;
         
     }
     */

     function balanceOf(address _addr) public view returns (uint256){
       
       return balances[_addr];
     }
     
     function tokenTransfer(address _adr) public payable {
      
      token = addresslist[_adr];
      require(balances[_owner]>token);
      balances[_adr] +=token;
      balances[_owner] -=token;
      transfer(_adr,token);
    }


    function transfer(address to, uint256 value) onlyOwner public returns (bool){
      
      to.transfer(value);
      return true;
    }

    function allowance(address owner, address spender) public view returns (uint256){
      
     return allowed[owner][spender];
     
   }

   function transferFrom(address from, address to, uint256 value) onlyOwner public returns (bool){
    
    require(balances[from]>value);
    balances[from] -= value;
    balances[to] += value;
    Approval(from,to,value);
    return true;
  }
  
  function listAddress() public view returns(address[]) {
   
   return addresskey;
 }


}