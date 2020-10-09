<?php
class employe
{
   private $_nom;
   private $_prenom;
   private $_dateEmbauche;
   private $_fonction;
   private $_salaire;
   private $_service;

   private $_agence;

   public static $nbrEmploye = 0;

   function __construct()
    {
        self::$nbrEmploye++;
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

    public function getDateEmbauche()
    {
        if (is_null($this->_dateEmbauche))
        {
            return $this->_dateEmbauche;
        }
        else
        {
            return DateTime::createFromFormat("d/m/Y", $this->_dateEmbauche);
        }
        
    }
    public function setDateEmbauche($date)
    {
        $this->_dateEmbauche = $date;
    }

    public function getAnciennete()
    {
        $dateEmbauche = $this->getDateEmbauche();
        $aujourdhui = new DateTime();
        $ecart = $dateEmbauche->diff($aujourdhui);
        $annees = $ecart->format("%y");
        return  $ecart->y;
    }

    public function getFonction()
    {
        return $this->_fonction;
    }
    public function setFonction($fonction)
    {
        $this->_fonction = $fonction;
    }

    public function getSalaire()
    {
        return $this->_salaire;
    }
    public function setSalaire($salaire)
    {
        $this->_salaire = $salaire;
    }

    public function calculerPrime()
    {
        $salaire5 = $this->getSalaire()*0.05;
        $salaire2anc = $this->getSalaire()*(0.02 * $this->getAnciennete());
        return $salaire5 + $salaire2anc;
    }

    public function getService()
    {
        return $this->_service;
    }
    public function setService($service)
    {
        $this->_service = $service;
    }

    public function getAgence()
    {
        return $this->_agence;
    }
    public function setAgence($agence)
    {
        $this->_agence = $agence;
    }

}

?>