# Nettoyage de la base de données
puts "🧹 Nettoyage de la base de données..."
Message.destroy_all
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
  description: "Incarnez un(e) aventurier(ère) dans un royaume médiéval menacé par un dragon ancestral. Explorez des donjons, affrontez des créatures fantastiques et forgez votre légende.",
  prompt: "Tu es le maître du jeu pour une aventure médiévale fantasy. Le joueur incarne un aventurier courageux. Crée une histoire immersive avec des choix significatifs, des combats (utilise des jets de dés simples : 1-10 pour l'action), des énigmes et des rencontres avec des PNJ mémorables. Le ton est épique et les descriptions sont riches. Le dragon final doit être un défi majeur. Adapte la difficulté selon les actions du joueur.
    IMPORTANT : Tu DOIS répondre UNIQUEMENT avec un objet JSON valide, sans texte avant ou après. Format obligatoire :
  {
    \"narration\": \"Ton texte narratif ici\",
    \"changes\": {
      \"health\": 5,
      \"inventory\": [\"item1\", \"item2\"],
      \"gold\": 10
    }
  }

  État actuel du jeu : health (0-100), inventory (tableau d'objets), location (string), gold (nombre), level (1-10).

  Règles :
  - Dans 'changes', inclus UNIQUEMENT les valeurs qui CHANGENT
  - health : utilise des nombres positifs pour soigner, négatifs pour blesser
  - inventory : liste les NOUVEAUX items trouvés ou SUPPRIME avec un '-' devant (ex: [\"-potion\"])
  - Crée une histoire immersive avec des choix, combats (jets de dés 1-10), énigmes
  - Adapte la difficulté selon les actions du joueur",
  initial_game_state: {
    health: 100,
    max_health: 100,
    inventory: ["épée en fer", "potion de soin"],
    location: "Village de Thornhaven",
    gold: 20,
    level: 1
  },
  active: true
)

scenario2 = Scenario.create!(
  name: "Meurtre à Londres",
  description: "1895, Londres. Un meurtre mystérieux secoue la haute société britannique. En tant que détective privé renommé, vous devez démêler les fils d'une intrigue complexe où rien n'est ce qu'il semble être.",
  prompt: "Tu es le maître du jeu pour une enquête policière victorienne. Le joueur est un détective privé expérimenté. Crée un mystère avec des indices subtils, des suspects avec des mobiles crédibles, des alibis à vérifier et des fausses pistes. L'atmosphère doit être mystérieuse et tendue. Le joueur doit pouvoir interroger des suspects, fouiller des lieux, analyser des indices. Maintiens la cohérence : les indices doivent mener logiquement au coupable. Révèle progressivement les informations.
  IMPORTANT : Tu DOIS répondre UNIQUEMENT avec un objet JSON valide, sans texte avant ou après. Format obligatoire :
  {
    \"narration\": \"Ton texte narratif ici\",
    \"changes\": {
      \"health\": 5,
      \"inventory\": [\"item1\", \"item2\"],
      \"gold\": 10
    }
  }

  État actuel du jeu : health (0-100), inventory (tableau d'objets), location (string), gold (nombre), level (1-10).

  Règles :
  - Dans 'changes', inclus UNIQUEMENT les valeurs qui CHANGENT
  - health : utilise des nombres positifs pour soigner, négatifs pour blesser
  - inventory : liste les NOUVEAUX items trouvés ou SUPPRIME avec un '-' devant (ex: [\"-potion\"])
  - Crée une histoire immersive avec des choix, combats (jets de dés 1-10), énigmes
  - Adapte la difficulté selon les actions du joueur",
  initial_game_state: {
    health: 100,
    max_health: 100,
    inventory: ["carnet de notes", "loupe", "badge de détective"],
    location: "Londres, Baker Street",
    gold: 0,
    level: 1
  },
  active: true
)

scenario3 = Scenario.create!(
  name: "Odyssée Stellaire",
  description: "An 2847. Aux commandes du vaisseau Odysseus, explorez la galaxie, négociez avec des civilisations alien, gérez vos ressources et survivez aux dangers du vide spatial.",
  prompt: "Tu es le maître du jeu pour une aventure de science-fiction spatiale. Le joueur est capitaine d'un vaisseau d'exploration. Crée des situations variées : exploration de planètes inconnues, diplomatie avec des races aliens aux cultures étranges, combats spatiaux tactiques, gestion de ressources (carburant, vivres, munitions). Le ton est réaliste avec une touche d'émerveillement. Utilise des concepts scientifiques crédibles. Les choix du joueur doivent avoir des conséquences à long terme.
  IMPORTANT : Tu DOIS répondre UNIQUEMENT avec un objet JSON valide, sans texte avant ou après. Format obligatoire :
  {
    \"narration\": \"Ton texte narratif ici\",
    \"changes\": {
      \"health\": 5,
      \"inventory\": [\"item1\", \"item2\"],
      \"gold\": 10
    }
  }

  État actuel du jeu : health (0-100), inventory (tableau d'objets), location (string), gold (nombre), level (1-10).

  Règles :
  - Dans 'changes', inclus UNIQUEMENT les valeurs qui CHANGENT
  - health : utilise des nombres positifs pour soigner, négatifs pour blesser
  - inventory : liste les NOUVEAUX items trouvés ou SUPPRIME avec un '-' devant (ex: [\"-potion\"])
  - Crée une histoire immersive avec des choix, combats (jets de dés 1-10), énigmes
  - Adapte la difficulté selon les actions du joueur",
  initial_game_state: {
    health: 100,
    max_health: 100,
    inventory: ["scanner portable", "communicateur", "rations de survie"],
    location: "Vaisseau Odysseus, orbite terrestre",
    gold: 100,
    level: 1
  },
  active: true
)

puts "✅ 3 scénarios créés"

# Récapitulatif
puts "\n" + "="*50
puts "🎉 Seeds créées avec succès !"
puts "="*50
puts "👤 Utilisateur : #{user.email} (mot de passe: password123)"
puts "📚 Scénarios : #{Scenario.count} (#{Scenario.where(active: true).count} actifs)"
puts "🎮 Parties : #{Game.count}"
puts "💬 Messages : #{Message.count}"
puts "="*50
