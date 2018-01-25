pragma solidity ^0.4.18;

import './SampleToken.sol';


contract SampleSale {

	//uint256 public token;
	SampleToken public stoken;

	function SampleSale() public{

		stoken = createToken();
		//stoken = new SampleToken();
	}

	function createToken() internal returns(SampleToken){

		return new SampleToken();
	}

	function list() public view returns(address[]){

		// return addresskey;
		stoken.listAddress();
	}

	function saleToken(address _adr) public{

		stoken.tokenTransfer(_adr);

	}

	function saleTokenFrom(address from, address to, uint256 value) public{

		stoken.transferFrom(from,to,value);

	}




}