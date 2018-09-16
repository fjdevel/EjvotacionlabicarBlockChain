pragma solidity ^0.4.24;

contract Election {
	
	//Modelo de Candidato

	struct Candidate{
		uint id;
		string name;
		uint votecount;
	}
	//Almacenamiento de Candidatos y votantes
	mapping(address => bool) public voters;
	mapping(uint => Candidate) public candidates;

	//Almacenamiento del conteo de Candidatos
	uint public candidatesCount;

	constructor() public {
		addCandidate("Candidato 1");
		addCandidate("Candidato 2");
  	}

  	function addCandidate(string _name) private{
  		candidatesCount ++;
  		candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
  	}

  	function vote(uint _candidateId) public{
  		//requiere que el votante no haya votado
  		require(!voters[msg.sender]);
  		//requiere que no se vote por un candidato invalido
  		require(_candidateId >0 && _candidateId<=candidatesCount);
  		// guardar el voto del votante
  		voters[msg.sender] = true;
  		//actualizar el numero de votos del candidato
  		candidates[_candidateId].votecount ++;

  	}
}