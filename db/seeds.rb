# Nettoyage de la base de données
puts "🧹 Nettoyage de la base de données..."
Message.destroy_all
Character.destroy_all
Game.destroy_all
Scenario.destroy_all
User.destroy_all

# Création d'un utilisateur
puts "👤 Création de l'utilisateur..."
user = User.create!(
  email: "eva@test.com",
  password: "password123",
  username: "eva_dev"
)

# Création des scénarios
puts "📚 Création des scénarios..."

scenario1 = Scenario.create!(
  name: "La Quête du Dragon",
  category: "Medieval",
  description: "Incarnez un(e) aventurier(ère) dans un royaume médiéval menacé par un dragon ancestral. Explorez des donjons, affrontez des créatures fantastiques et forgez votre légende.",
  prompt: "Tu es le maître du jeu pour une aventure médiévale fantasy. Le joueur incarne un aventurier courageux. Crée une histoire immersive avec des choix significatifs, des combats (utilise des jets de dés simples : 1-10 pour l'action), des énigmes et des rencontres avec des PNJ mémorables. Le ton est épique et les descriptions sont riches. Le dragon final doit être un défi majeur. Adapte la difficulté selon les actions du joueur.
    IMPORTANT : Tu DOIS répondre UNIQUEMENT avec un objet JSON valide, sans texte avant ou après. Format obligatoire :
  {
    \"narration\": \"Ton texte narratif ici\",
    \"changes\": {
      \"health\": 5,
      \"inventory\": [\"item1\", \"item2\"],
      \"gold\": 10,
      \"experience\": 50
    }
  }

  État actuel du jeu : health (0-100), inventory (tableau d'objets), location (string), gold (nombre), level (1-10), experience (nombre).

  Règles :
  - Dans 'changes', inclus UNIQUEMENT les valeurs qui CHANGENT
  - health : utilise des nombres positifs pour soigner, négatifs pour blesser
  - inventory : liste les NOUVEAUX items trouvés ou SUPPRIME avec un '-' devant (ex: [\"-potion\"])
  - experience : donne de l'XP selon la difficulté de l'action (exploration: 10-30, combat facile: 30-50, combat difficile: 50-100, résolution de quête: 100-200)
  - Crée une histoire immersive avec des choix, combats (jets de dés 1-10), énigmes
  - Adapte la difficulté selon les actions du joueur",
  initial_game_state: {
    health: 100,
    max_health: 100,
    inventory: [],
    location: "Village de Thornhaven",
    gold: 20,
    level: 1
  },
  available_classes: {
    "guerrier" => {
      "description" => "Maître du combat au corps à corps, le guerrier excelle dans l'art de la bataille",
      "skills" => {
        "force" => 8,
        "intelligence" => 4,
        "agilité" => 6,
        "charisme" => 5
      },
      "starting_items" => ["épée en fer", "bouclier en bois", "potion de soin"]
    },
    "mage" => {
      "description" => "Manipulateur des arcanes, le mage plie la magie à sa volonté",
      "skills" => {
        "force" => 3,
        "intelligence" => 9,
        "agilité" => 5,
        "charisme" => 6
      },
      "starting_items" => ["bâton magique", { "livre de sorts" => ["Boule de feu", "Bouclier magique", "Soin léger"] }, "potion de mana"]
    },
    "voleur" => {
      "description" => "Rapide et discret, le voleur frappe dans l'ombre",
      "skills" => {
        "force" => 5,
        "intelligence" => 6,
        "agilité" => 9,
        "charisme" => 4
      },
      "starting_items" => ["dague", "crochets de crochetage", "cape d'ombre"]
    }
  },
  active: true
)

scenario2 = Scenario.create!(
  name: "Meurtre à Londres",
  category: "Thriller",
  description: "1895, Londres. Un meurtre mystérieux secoue la haute société britannique. En tant que détective privé renommé, vous devez démêler les fils d'une intrigue complexe où rien n'est ce qu'il semble être.",
  prompt: "Tu es le maître du jeu pour une enquête policière victorienne. Le joueur est un détective privé expérimenté. Crée un mystère avec des indices subtils, des suspects avec des mobiles crédibles, des alibis à vérifier et des fausses pistes. L'atmosphère doit être mystérieuse et tendue. Le joueur doit pouvoir interroger des suspects, fouiller des lieux, analyser des indices. Maintiens la cohérence : les indices doivent mener logiquement au coupable. Révèle progressivement les informations.
  IMPORTANT : Tu DOIS répondre UNIQUEMENT avec un objet JSON valide, sans texte avant ou après. Format obligatoire :
  {
    \"narration\": \"Ton texte narratif ici\",
    \"changes\": {
      \"health\": 5,
      \"inventory\": [\"item1\", \"item2\"],
      \"gold\": 10,
      \"experience\": 50
    }
  }

  État actuel du jeu : health (0-100), inventory (tableau d'objets), location (string), gold (nombre), level (1-10), experience (nombre).

  Règles :
  - Dans 'changes', inclus UNIQUEMENT les valeurs qui CHANGENT
  - health : utilise des nombres positifs pour soigner, négatifs pour blesser
  - inventory : liste les NOUVEAUX items trouvés ou SUPPRIME avec un '-' devant (ex: [\"-potion\"])
  - experience : donne de l'XP selon la difficulté (interrogatoire: 20-40, découverte d'indice: 30-60, déduction correcte: 50-80, résolution du mystère: 200-300)
  - Crée une histoire immersive avec des choix, combats (jets de dés 1-10), énigmes
  - Adapte la difficulté selon les actions du joueur",
  initial_game_state: {
    health: 100,
    max_health: 100,
    inventory: [],
    location: "Londres, Baker Street",
    gold: 0,
    level: 1
  },
  available_classes: {
    "détective" => {
      "description" => "Enquêteur brillant, expert en déduction et observation",
      "skills" => {
        "observation" => 9,
        "déduction" => 8,
        "charisme" => 6,
        "combat" => 4
      },
      "starting_items" => ["carnet de notes", "loupe", "badge de détective", "revolver"]
    },
    "médecin légiste" => {
      "description" => "Spécialiste des sciences forensiques et de la médecine",
      "skills" => {
        "observation" => 7,
        "déduction" => 7,
        "charisme" => 5,
        "combat" => 3
      },
      "starting_items" => ["sacoche médicale", "scalpel", "notes médicales", "microscope portable"]
    }
  },
  active: true
)

scenario3 = Scenario.create!(
  name: "Odyssée Stellaire",
  category: "SF",
  description: "An 2847. Aux commandes du vaisseau Odysseus, explorez la galaxie, négociez avec des civilisations alien, gérez vos ressources et survivez aux dangers du vide spatial.",
  prompt: "Tu es le maître du jeu pour une aventure de science-fiction spatiale. Le joueur est capitaine d'un vaisseau d'exploration. Crée des situations variées : exploration de planètes inconnues, diplomatie avec des races aliens aux cultures étranges, combats spatiaux tactiques, gestion de ressources (carburant, vivres, munitions). Le ton est réaliste avec une touche d'émerveillement. Utilise des concepts scientifiques crédibles. Les choix du joueur doivent avoir des conséquences à long terme.
  IMPORTANT : Tu DOIS répondre UNIQUEMENT avec un objet JSON valide, sans texte avant ou après. Format obligatoire :
  {
    \"narration\": \"Ton texte narratif ici\",
    \"changes\": {
      \"health\": 5,
      \"inventory\": [\"item1\", \"item2\"],
      \"gold\": 10,
      \"experience\": 50
    }
  }

  État actuel du jeu : health (0-100), inventory (tableau d'objets), location (string), gold (nombre = crédits galactiques), level (1-10), experience (nombre).

  Règles :
  - Dans 'changes', inclus UNIQUEMENT les valeurs qui CHANGENT
  - health : utilise des nombres positifs pour soigner, négatifs pour blesser
  - inventory : liste les NOUVEAUX items trouvés ou SUPPRIME avec un '-' devant (ex: [\"-carburant\"])
  - experience : donne de l'XP selon la difficulté (scan planétaire: 20-40, négociation: 40-70, combat spatial: 60-100, découverte majeure: 150-250)
  - Crée une histoire immersive avec des choix, combats (jets de dés 1-10), énigmes
  - Adapte la difficulté selon les actions du joueur",
  initial_game_state: {
    health: 100,
    max_health: 100,
    inventory: [],
    location: "Vaisseau Odysseus, orbite terrestre",
    gold: 100,
    level: 1
  },
  available_classes: {
    "pilote" => {
      "description" => "As du pilotage, expert en manœuvres spatiales",
      "skills" => {
        "pilotage" => 9,
        "technique" => 6,
        "diplomatie" => 4,
        "combat" => 6
      },
      "starting_items" => ["scanner portable", "combinaison spatiale", "blaster"]
    },
    "ingénieur" => {
      "description" => "Génie technique, capable de réparer n'importe quel système",
      "skills" => {
        "pilotage" => 5,
        "technique" => 9,
        "diplomatie" => 4,
        "combat" => 4
      },
      "starting_items" => ["multi-tool", "kit de réparation", "drone assistant"]
    },
    "diplomate" => {
      "description" => "Expert en relations xénopolitiques et négociation",
      "skills" => {
        "pilotage" => 4,
        "technique" => 4,
        "diplomatie" => 9,
        "combat" => 3
      },
      "starting_items" => ["traducteur universel", "datapad diplomatique", "cadeau protocolaire"]
    }
  },
  active: false
)

puts "✅ 3 scénarios créés (2 actifs, 1 en test)"

# Récapitulatif
puts "\n" + "="*50
puts "🎉 Seeds créées avec succès !"
puts "="*50
puts "👤 Utilisateur : #{user.email} (mot de passe: password123)"
puts "📚 Scénarios : #{Scenario.count} (#{Scenario.where(active: true).count} actifs)"
puts "="*50
