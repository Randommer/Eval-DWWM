// Création du tableau, les cases de la dernière ligne et de la denière colonne sont mises à zéro

const tailletab = { lig: 4, col: 5 }; // variable qui définie la taille du tableau

const atab = Array(tailletab.lig); // construction du tableau avec le nombre de lignes voulues

for (let x = 0; x < atab.length; x++) // boucle de création des colonnes et mise à zéro de la dernière colonne et la dernière ligne
{
    atab[x] = Array(tailletab.col); // contruction des collones dans la ligne x du tableau
    if (x != atab.length-1) // si on est pas dans la dernière ligne du tableau
    {
        atab[x][atab[x].length-1] = 0; // on met à zéro la dernière colonne de la ligne x
    }
    else // si on est sur la dernière ligne du tableau
    {
        for (let y = 0; y < atab[x].length; y++) // boucle qui parcours tout les colonnes de la ligne
        {
            atab[x][y] = 0; // on met à zéro la colonne de coordonnées x,y
        }
    }
};

// Autre façon de créer le tableau avec les cases de la dernière ligne et de la denière colonne à zéro 

// const atab = [
//     [ , , , ,0],
//     [ , , , ,0],
//     [ , , , ,0],
//     [0,0,0,0,0]
// ];

// Boucles de remplissage du tableau

console.log("Remplissage");
for (let x = 0; x < atab.length-1; x++) // boucle de parcours des lignes du tableau, sauf la dernière ligne
{
    for (let y = 0; y < atab[x].length-1; y++) // boucle de parcours des colonnes d'une ligne, sauf la dernière ligne
    {
        console.log("Remplissage de la case ligne "+(x+1)+" et colonne "+(y+1)); // message console à l'utilisateur
        atab[x][y] = parseInt(prompt("Case de coordonnées ("+(x+1)+", "+(y+1)+")\nRemplir avec la valeur ?")); // demande à l'utilisateur de rentrer un nombre entier qui sera enregistré dans la case de coordonnées x,y (si l'entrée n'est pas un nombre entier, NaN sera enregistré)
    }
};

// Boucles de calculs de la somme des lignes et des colonnes

for (let x = 0; x < atab.length-1; x++) // boucle de parcours des lignes du tableau, sauf la dernière ligne
{
    for (let y = 0; y < atab[x].length-1; y++) // boucle de parcours des colonnes d'une ligne, sauf la dernière ligne
    {
        atab[x][atab[x].length-1] = atab[x][atab[x].length-1]+atab[x][y]; // on ajoute la case de coordonnées x,y au total de la ligne x
        atab[atab.length-1][y] = atab[atab.length-1][y]+atab[x][y]; // on ajoute la case de coordonnées x,y au total de la colonne y
    }
    atab[atab.length-1][atab[atab.length-1].length-1] = atab[atab.length-1][atab[atab.length-1].length-1]+atab[x][atab[atab.length-1].length-1]; // on ajoute le total de la ligne x au total de toutes les cases du tableau
};

//Affichage du tableau final

console.log(atab); // on affiche le tableau


// version dérivée du pseudo-code de Hervé

/* Déclaration des variables */
const TB = Array(Array(5), Array(5), Array(5), Array(5));
let LIGNE, COLONNE;
/* Initialisation du tableau TB avec des zéros */
for (LIGNE = 0; LIGNE < TB.length; LIGNE++)
{
    for (COLONNE = 0; COLONNE < TB[LIGNE].length; COLONNE++)
    {
        TB[LIGNE][COLONNE] = 0;
    }
};
/* Initialisation du tableau TB avec des valeurs lues */
for (LIGNE = 0; LIGNE < TB.length-1; LIGNE++)
{
    for (COLONNE = 0; COLONNE < TB[LIGNE].length-1; COLONNE++)
    {
        TB[LIGNE][COLONNE] = parseInt(prompt("TB("+(LIGNE+1)+","+(COLONNE+1)+")="));
    }
};
/* Additions en colonne 5 et ligne 4 */
for (LIGNE = 0; LIGNE < TB.length-1; LIGNE++)
{
    for (COLONNE = 0; COLONNE < TB[LIGNE].length-1; COLONNE++)
    {
        TB[LIGNE][TB[LIGNE].length-1] = TB[LIGNE][TB[LIGNE].length-1] + TB[LIGNE][COLONNE];
        TB[TB.length-1][COLONNE] = TB[TB.length-1][COLONNE] + TB[LIGNE][COLONNE];
    }
};

console.table(TB);