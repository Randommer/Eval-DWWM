<?php
class agence
{
    private $_nom;
    private $_adresse;
    private $_codePostal;
    private $_ville;
    private $_modeRestauration;
    
    function __construct()
    {
        $this->_nom = null;
        $this->_adresse = null;
        $this->_codePostal = null;
        $this->_ville = null;
        $this->_modeRestauration = null;
    }

    public function getNom()
    {
        return $this->_nom;
    }
    public function setNom($nom)
    {
        $this->_nom = $nom;
    }

    public function getAdresse()
    {
        return $this->_adresse;
    }
    public function setAdresse($adresse)
    {
        $this->_adresse = $adresse;
    }

    public function getCodePostal()
    {
        return $this->_codePostal;
    }
    public function setCodePostal($CP)
    {
        $this->_codePostal = $CP;
    }

    public function getVille()
    {
        return $this->_ville;
    }
    public function setVille($ville)
    {
        $this->_ville = $ville;
    }

    public function getModeRestauration()
    {
        return $this->_modeRestauration;
    }
    public function setModeRestauration($restau)
    {
        $this->_modeRestauration = $restau;
    }
}

?>