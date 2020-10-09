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
    private $_enfants;

    public static $nbrEmploye = 0;

    function __construct()
    {
        $this->_nom = null;
        $this->_prenom = null;
        $this->_dateEmbauche = null;
        $this->_fonction = null;
        $this->_salaire = null;
        $this->_service = null;
        $this->_agence = null;
        $this->_enfants = null;
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
        return $this->_dateEmbauche;
    }
    public function setDateEmbauche($date)
    {
        if (is_string($date))
        {
            $this->_dateEmbauche = DateTime::createFromFormat("d/m/Y", $date);
        }
        else
        {
            $this->_dateEmbauche = DateTime::createFromFormat("d/m/Y", $date->format("d/m/Y"));
        }
    }

    public function getAnciennete()
    {
        $date = new DateTime();
        $d_embauche = $this->getDateEmbauche();
        $interval = $d_embauche->diff($date);
        return intval($interval->format("%y"));
    }

    public function isChequeVacance()
    {
        if ($this->getAnciennete() > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
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
        $prime = $this->getSalaire()*0.05 + $this->getSalaire()*(0.02*$this->getAnciennete());
        return intval($prime);
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

    public function getEnfants()
    {
        return $this->_enfants;
    }
    public function setEnfants($enfants)
    {
        if (count($enfants) == 0)
        {
            $this->_enfants = null;
        }
        else
        {
            $this->_enfants = $enfants;
        }
    }

    public function chequesNoel()
    {
        $enfants = $this->getEnfants();
        if (is_null($enfants))
        {
            //return "Non";
            return array();
        }
        else
        {
            $primaire = 0;
            $college = 0;
            $lycee = 0;
            foreach ($enfants as $i => $age)
            {
                if ($age >= 0 && $age <= 10)
                {
                    $primaire++;
                }
                if ($age >= 11 && $age <= 15)
                {
                    $college++;
                }
                if ($age >= 16 && $age <= 18)
                {
                    $lycee++;
                }
            }
            if ($primaire == 0 && $college == 0 && $lycee ==0)
            {
                //return "Non";
                return array();
            }
            else
            {
                /*
                $cheques = "Oui";
                if ($primaire != 0)
                {
                    $cheques = $cheques.", ".$primaire." chèque(s) de 20 €";
                }
                if ($college != 0)
                {
                    $cheques = $cheques.", ".$college." chèque(s) de 30 €";
                }
                if ($lycee != 0)
                {
                    $cheques = $cheques.", ".$lycee." chèque(s) de 50 €";
                }
                return $cheques;
                */
                return array($primaire, $college, $lycee);
            }
        }
    }
}

class directeur extends employe
{
    public function calculerPrime()
    {
        $prime = $this->getSalaire()*0.07 + $this->getSalaire()*(0.03*$this->getAnciennete());
        return intval($prime);
    }
}

?>