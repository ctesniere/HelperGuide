# Guide Perso

## Java Tools

### Template

* [Velocity](http://velocity.apache.org/engine/devel/developer-guide.html)  
Moteur de template pour document ou mail


## Git

### Installation

Avec Homebrew, l'installation de Git est très simple et simplifie les mises à jour :

```bash
$ brew update
$ brew install git
```

Pour s'assurer que tous fonctionnent correctement, utiliser la commande `$ brew doctor`.
Si vous avez cette erreur `Warning: /usr/bin occurs before /usr/local/bin`, executer cette commande :

```bash
$ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
```

Enfin, assurer vous que Git est correctement installé grâce à `git --version`

### Configuration

```bash
$ git config --global user.name "Full Name"
$ git config --global user.email "Email"
$ git config --global color.ui true
```

### Votre éditeur

Vous pouvez configurer l'éditeur de texte par défaut qui sera utilisé par Git si vous avez besoin d'écrire un message ou lors d'un rebase.

```bash
$ git config --global core.editor "subl -n -w"
```

### alias

Les alias basic 

```bash
st = status
br = branch -vv -a
branch = branch -vv
co = checkout
cob = checkout -b
ci = commit
```



## Styleguide Java

### Terminologie et définition

* PascalCase : Chaque premier mot commence par un UpperCase. Ex: FooBar
* CamelCase : Première lettre utilisant une minuscule et chaque premier mot commence par une majuscule. Ex: fooBar
* AllUpperCase : Alphabet en majuscule. Ex: FOO_BAR
* AllLowerCase : Alphabet en minuscule. Ex: foo.bar ou foo_bar

### Class

### Methode

### Field

### Enum

* Le nom d'une enum doit-être écrit en PascalCase
* Aucun `s` a la fin du nom d'un Enum

### toString() != get()

Le toString doit être utilisé seulement dans le cas ou l'on souhaite avoir `(String) Enum`

Le get doit être utilisé seulement quand c'est une valeur qui ne correspond pas a `(String) Enum`

Exemple :

```java
class ExempleEnum {

  public enum Region {
    EUROPE("e"),
    US("s");

    private String name = "";

    Region(String name) {
      this.name = name;
    }

    public String get() {
      return name;
    }
  }

  public void value(Region region) {
    region.toString(); // retourne "EUROPE"
    region.get(); // retourne "s"
  }
}
```

### Optimisation

Éviter d'utiliser `Arrays.asList(...)` car possède des fluites mémoires.

### Intellij

#### Saut de ligne

Afin d'ajouter un saut de ligne à vos fichier automatiquement :  
`IDE Settings / Editor` et sélectionner `Ensure line feed at file end on saving`

#### Import inutile

Dans la plupart des cas, il y a des imports que l'on va ne va utiliser. Dans "Settings/Auto Import", ajouter ceci à la liste des exclusions :

```
com.google.api.client.repackaged
com.google.api.client.util
com.google.appengine.repackaged
```
