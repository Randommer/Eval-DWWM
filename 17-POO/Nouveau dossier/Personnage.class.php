<?php
class personnage
{
    private $_nom;
    private $_prenom;
    private $_age;
    private $_sexe;

    function __construct()
    {
        $this->_nom = null;
        $this->_prenom = null;
        $this->_age = null;
        $this->_sexe = null;
    }

    public function getNom()
    {
        return $this->_nom;
    }
    public function setNom($nom)
    {
        $this->_nom = $nom;
    }

    public function getPrenom()
    {
        return $this->_prenom;
    }
    public function setPrenom($prenom)
    {
        $this->_prenom = $prenom;
    }

    public function getAge()
    {
        return $this->_age;
    }
    public function setAge($age)
    {
        $this->_age = $age;
    }

    public function getSexe()
    {
        return $this->_sexe;
    }
    public function setSexe($sexe)
    {
        $this->_sexe = $sexe;
    }
}

?>