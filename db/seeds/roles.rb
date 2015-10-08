td = Group.create!(name: 'Tecnologie Democratiche')
gda = Group.create!(name: 'Team Airesis')

['Analisi', 'Programmazione software', 'Debugging (Test)', 'Sicurezza (Cifratura e Preservazione dei Dati)',
 'Grafica', 'SEO', 'Ricerca & Sviluppo (innovazioni)', 'Internazionalizzazione (Lingue)',
 'Assistenza (Help Desk Utenza)'].each do |role|
  Role.create!(name: role, group: gda)
end

['Partecipazione al consiglio direttivo (art. 9), bilancio, eventi, controllo ed esecutività dei lavori in corso',
 'Relazioni con le strutture istituzionali per la promozione di AIRESIS',
 'Comunicazione interna e responsabilità rapporti interni con gli associati',
 'Promozione online, cartacea e raccolta fondi',
 'Certificazione degli associati e degli utenti di AIRESIS'].each do |role|
 Role.create!(name: role, group: td)
end
