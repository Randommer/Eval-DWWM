<?php
include "./Personnage.class.php";

class personnageDefault extends personnage
{
    private $_nom;
    private $_prenom;
    private $_age;
    private $_sexe;

    function __construct()
    {
        $this->setNom("Loper");
        $this->setPrenom("Dave");
        $this->setAge(18);
        $this->setSexe("Masculin");
    }
}

// class personnageDefault
// {
//     private $_nom;
//     private $_prenom;
//     private $_age;
//     private $_sexe;

//     function __construct()
//     {
//         $this->_nom = "Loper";
//         $this->_prenom = "Dave";
//         $this->_age = 18;
//         $this->_sexe = "Masculin";
//     }

//     public function getNom()
//     {
//         return $this->_nom;
//     }
//     public function setNom($nom)
//     {
//         $this->_nom = $nom;
//     }

//     public function getPrenom()
//     {
//         return $this->_prenom;
//     }
//     public function setPrenom($prenom)
//     {
//         $this->_prenom = $prenom;
//     }

//     public function getAge()
//     {
//         return $this->_age;
//     }
//     public function setAge($age)
//     {
//         $this->_age = $age;
//     }

//     public function getSexe()
//     {
//         return $this->_sexe;
//     }
//     public function setSexe($sexe)
//     {
//         $this->_sexe = $sexe;
//     }
// }

?>