// Upgrade Manager - Step Event
// Gérer la logique des améliorations en temps réel

// Vérifier si les améliorations sont chargées
if (!global.upgrades_loaded) {
    load_upgrades();
    return;
}

// Appliquer les effets d'amélioration en continu
apply_upgrade_effects();
