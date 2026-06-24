// Translation Dictionary
const i18n = {
  fr: {
    tabHome: "Accueil",
    tabPlanning: "Planning",
    tabProgress: "Progression",
    tabOrganizer: "Organisateur",
    tabProfile: "Profil",
    welcome: "Salut, {name} ! 👋",
    dailyProgressTitle: "Progression du jour",
    activitiesToday: "Activités d'aujourd'hui",
    noActivitiesToday: "Aucune activité planifiée aujourd'hui.",
    goToPlanning: "Rends-toi sur l'onglet 'Planning' pour organiser ta journée !",
    tasksDone: "{done} sur {total} activités terminées",
    encouragement0: "Prêt à commencer la journée ? 💪",
    encouragementLow: "C'est un bon début, continue ! ⚡️",
    encouragementMid: "Déjà plus de la moitié faite ! 🌟",
    encouragementHigh: "Presque fini ! Ne lâche rien ! 🔥",
    encouragementPerfect: "Journée parfaite ! Tu es au top ! 🏆",
    myPlanning: "Mon planning du {day}",
    activitiesCount: "{count} activités",
    noActivitiesDay: "Aucune activité de programmée ce jour.",
    createTimeBlocks: "Crée des blocs de temps pour planifier ta réussite.",
    addActivity: "Créer une activité",
    editActivity: "Modifier l'activité",
    generalInfo: "Informations générales",
    activityNamePlaceholder: "Nom de l'activité (ex: Cours de maths)",
    weekdayLabel: "Jour de la semaine",
    optionalNote: "Note optionnelle",
    hoursSection: "Horaires",
    startTimeLabel: "Heure de début",
    endTimeLabel: "Heure de fin",
    categoryLabel: "Catégorie",
    styleSection: "Style & Personnalisation",
    customIconLabel: "Icône personnalisée",
    customColorLabel: "Couleur personnalisée",
    reminderSection: "Notification de rappel",
    notifyMe: "M'avertir",
    noReminder: "Aucun rappel",
    atExactTime: "À l'heure exacte",
    minsBefore: "{mins} minutes avant",
    cancelBtn: "Annuler",
    saveBtn: "Enregistrer",
    deleteBtn: "Supprimer cette activité",
    streakLabel: "Série de jours",
    weeklySuccessLabel: "Semaine passée",
    todayBreakdownTitle: "Aujourd'hui",
    statusDoneLabel: "Fait",
    statusNotDoneLabel: "Pas fait",
    statusPostponedLabel: "Reporté",
    chartTitle: "Répartition par Catégorie (Faites)",
    noChartData: "Aucune donnée enregistrée pour le moment.",
    coachAdviceTitle: "Le conseil de l'Organisateur",
    identitySection: "Identité",
    pseudoLabel: "Pseudo",
    quoteLabel: "Phrase perso",
    avatarSection: "Choisis ton Avatar",
    visualThemeSection: "Thème Visuel",
    appColorSection: "Couleur de l'application",
    settingsSection: "Paramètres de l'application",
    systemReminders: "Rappels",
    authNotifications: "Autorisation Notifications",
    testReminderBtn: "Tester un rappel instantané (5s)",
    localDataSection: "Gestion des Données locales",
    templatesCountLabel: "Activités programmées",
    historyCountLabel: "Historique complété",
    exportDataBtn: "Exporter ma configuration (JSON)",
    dangerZone: "Zone de Danger",
    resetAppBtn: "Réinitialiser l'application",
    langLabel: "Langue",
    victoryToast: "Super boulot ! +1 en discipline ! 🔥",
    alertResetConfirm: "Cette action supprimera définitivement tout ton planning, tes statistiques ainsi que tes discussions locales. Continuer ?",
    alertInstantTest: "Rappel de test programmé !",
    alertInstantTestBody: "Bravo, ton rappel local fonctionne parfaitement ! ⏰",
    
    // Weekdays
    1: "Dimanche", 2: "Lundi", 3: "Mardi", 4: "Mercredi", 5: "Jeudi", 6: "Vendredi", 7: "Samedi",
    monShort: "Lun", tueShort: "Mar", wedShort: "Mer", thuShort: "Jeu", friShort: "Ven", satShort: "Sam", sunShort: "Dim",
    
    // Categories
    ecole: "École", sport: "Sport", famille: "Famille", devoirs: "Devoirs", repos: "Repos", objectif: "Objectif perso", autre: "Autre"
  },
  en: {
    tabHome: "Home",
    tabPlanning: "Schedule",
    tabProgress: "Progress",
    tabOrganizer: "Organizer",
    tabProfile: "Profile",
    welcome: "Hey, {name}! 👋",
    dailyProgressTitle: "Daily Progress",
    activitiesToday: "Today's Activities",
    noActivitiesToday: "No activities scheduled for today.",
    goToPlanning: "Go to the 'Schedule' tab to organize your day!",
    tasksDone: "{done} out of {total} activities completed",
    encouragement0: "Ready to start the day? 💪",
    encouragementLow: "Good start, keep going! ⚡️",
    encouragementMid: "Already more than half done! 🌟",
    encouragementHigh: "Almost finished! Don't give up! 🔥",
    encouragementPerfect: "Perfect day! You are at the top! 🏆",
    myPlanning: "My schedule for {day}",
    activitiesCount: "{count} activities",
    noActivitiesDay: "No activities scheduled for this day.",
    createTimeBlocks: "Create time blocks to plan your success.",
    addActivity: "Create an Activity",
    editActivity: "Modify Activity",
    generalInfo: "General Information",
    activityNamePlaceholder: "Activity name (e.g. Math Class)",
    weekdayLabel: "Day of the Week",
    optionalNote: "Optional Note",
    hoursSection: "Hours",
    startTimeLabel: "Start Time",
    endTimeLabel: "End Time",
    categoryLabel: "Category",
    styleSection: "Style & Customization",
    customIconLabel: "Custom Icon",
    customColorLabel: "Custom Color",
    reminderSection: "Reminder Notification",
    notifyMe: "Notify Me",
    noReminder: "No reminder",
    atExactTime: "At exact start time",
    minsBefore: "{mins} minutes before",
    cancelBtn: "Cancel",
    saveBtn: "Save",
    deleteBtn: "Delete this activity",
    streakLabel: "Day Streak",
    weeklySuccessLabel: "Last Week",
    todayBreakdownTitle: "Today",
    statusDoneLabel: "Done",
    statusNotDoneLabel: "Missed",
    statusPostponedLabel: "Postponed",
    chartTitle: "Distribution by Category (Done)",
    noChartData: "No data recorded yet.",
    coachAdviceTitle: "Organizer's Advice",
    identitySection: "Identity",
    pseudoLabel: "Nickname",
    quoteLabel: "Personal Quote",
    avatarSection: "Choose your Avatar",
    visualThemeSection: "Visual Theme",
    appColorSection: "App Theme Color",
    settingsSection: "App Settings",
    systemReminders: "Reminders",
    authNotifications: "Notification Permission",
    testReminderBtn: "Test instant reminder (5s)",
    localDataSection: "Local Data Management",
    templatesCountLabel: "Scheduled Activities",
    historyCountLabel: "History Completed",
    exportDataBtn: "Export config (JSON)",
    dangerZone: "Danger Zone",
    resetAppBtn: "Reset application",
    langLabel: "Language",
    victoryToast: "Great job! +1 discipline! 🔥",
    alertResetConfirm: "This action will permanently delete all your schedule, statistics, and local chats. Continue?",
    alertInstantTest: "Test reminder scheduled!",
    alertInstantTestBody: "Bravo, your local reminder works perfectly! ⏰",
    
    // Weekdays
    1: "Sunday", 2: "Monday", 3: "Tuesday", 4: "Wednesday", 5: "Thursday", 6: "Friday", 7: "Saturday",
    monShort: "Mon", tueShort: "Tue", wedShort: "Wed", thuShort: "Thu", friShort: "Fri", satShort: "Sat", sunShort: "Sun",
    
    // Categories
    ecole: "School", sport: "Sport", famille: "Family", devoirs: "Homework", repos: "Rest", objectif: "Goal", autre: "Other"
  }
};

// Global App State
let state = {
  lang: 'fr',
  user_pseudo: 'Champion',
  user_avatar: '🚀',
  user_quote: "Rien ne t'arrête ! 🚀",
  theme_color: '#7209B7',
  theme_name: 'Minimaliste',
  templates: [], // Weekly activity templates
  logs: [], // Execution history Logs
  chats: [], // Assistant chat message history
  selectedDay: 2, // Default to Monday (2)
  editingTemplateId: null
};

// Available Presets matching Theme.swift
const AVATARS = ['🚀', '⚡️', '🏆', '🌟', '🔥', '❤️', '🎮', '📚', '😴', '👑'];
const THEME_NAMES = ['Minimaliste', 'Néon / Cyberpunk', 'Doux Pastel', 'Rétro Gaming'];
const THEME_COLORS = ['#7209B7', '#3A86F0', '#FF006E', '#38B000', '#FF7B00', '#2B2D42', '#FFD166'];
const ICONS = ['📚', '🏃‍♂️', '❤️', '📝', '😴', '🎯', '⚙️', '🎮', '🎵', '🛒', '📺', '💬', '💼', '🎓'];
const CATEGORIES = ['ecole', 'sport', 'famille', 'devoirs', 'repos', 'objectif', 'autre'];
const CATEGORY_MAP = {
  ecole: { emoji: '📚', color: '#3A86F0' },
  sport: { emoji: '🏃‍♂️', color: '#38B000' },
  famille: { emoji: '❤️', color: '#FF006E' },
  devoirs: { emoji: '📝', color: '#FF7B00' },
  repos: { emoji: '😴', color: '#7209B7' },
  objectif: { emoji: '🎯', color: '#FFB703' },
  autre: { emoji: '⚙️', color: '#8D99AE' }
};

// Get translation text
function t(key, replacements = {}) {
  let text = i18n[state.lang][key] || key;
  for (const [k, v] of Object.entries(replacements)) {
    text = text.replace(`{${k}}`, v);
  }
  return text;
}

// Convert Hex to RGBA for transparent backgrounds
function hexToRgba(hex, alpha = 1) {
  let c;
  if (/^#([A-Fa-f0-9]{3}){1,2}$/.test(hex)) {
    c = hex.substring(1).split('');
    if (c.length == 3) {
      c = [c[0], c[0], c[1], c[1], c[2], c[2]];
    }
    c = '0x' + c.join('');
    return `rgba(${(c >> 16) & 255}, ${(c >> 8) & 255}, ${c & 255}, ${alpha})`;
  }
  return hex;
}

// Load configurations from Local Storage
function loadLocalData() {
  state.lang = localStorage.getItem('lifeflow_lang') || 'fr';
  state.user_pseudo = localStorage.getItem('lifeflow_pseudo') || 'Champion';
  state.user_avatar = localStorage.getItem('lifeflow_avatar') || '🚀';
  state.user_quote = localStorage.getItem('lifeflow_quote') || (state.lang === 'fr' ? "Rien ne t'arrête ! 🚀" : "Nothing stops you! 🚀");
  state.theme_color = localStorage.getItem('lifeflow_theme_color') || '#7209B7';
  state.theme_name = localStorage.getItem('lifeflow_theme_name') || 'Minimaliste';
  
  state.templates = JSON.parse(localStorage.getItem('lifeflow_templates')) || [];
  state.logs = JSON.parse(localStorage.getItem('lifeflow_logs')) || [];
  state.chats = JSON.parse(localStorage.getItem('lifeflow_chats')) || [];
}

// Save profile options
function saveProfile() {
  localStorage.setItem('lifeflow_lang', state.lang);
  localStorage.setItem('lifeflow_pseudo', state.user_pseudo);
  localStorage.setItem('lifeflow_avatar', state.user_avatar);
  localStorage.setItem('lifeflow_quote', state.user_quote);
  localStorage.setItem('lifeflow_theme_color', state.theme_color);
  localStorage.setItem('lifeflow_theme_name', state.theme_name);
}

// Save planner data
function savePlanner() {
  localStorage.setItem('lifeflow_templates', JSON.stringify(state.templates));
  localStorage.setItem('lifeflow_logs', JSON.stringify(state.logs));
}

// Save chat history
function saveChats() {
  localStorage.setItem('lifeflow_chats', JSON.stringify(state.chats));
}

// Apply visual themes styling
function applyTheme() {
  document.body.setAttribute('data-theme', state.theme_name);
  const root = document.documentElement;
  root.style.setProperty('--primary-color', state.theme_color);
  
  // Parse RGB components for transparent styling
  let rgb = '114, 9, 183';
  if (/^#([A-Fa-f0-9]{3}){1,2}$/.test(state.theme_color)) {
    let c = state.theme_color.substring(1).split('');
    if (c.length == 3) c = [c[0], c[0], c[1], c[1], c[2], c[2]];
    c = '0x' + c.join('');
    rgb = `${(c >> 16) & 255}, ${(c >> 8) & 255}, ${c & 255}`;
  }
  root.style.setProperty('--primary-color-rgb', rgb);
}

// Toast alerts
function showToast(message) {
  const toast = document.getElementById('toast');
  toast.innerHTML = `<span>🎉</span> <span>${message}</span>`;
  toast.classList.add('active');
  setTimeout(() => {
    toast.classList.remove('active');
  }, 3000);
}

// Routing Tab Controller
function navigateTo(tabId) {
  document.querySelectorAll('.view').forEach(view => view.classList.remove('active'));
  document.querySelectorAll('.nav-item').forEach(item => item.classList.remove('active'));
  
  const targetView = document.getElementById(`view-${tabId}`);
  const targetNavItem = document.getElementById(`nav-${tabId}`);
  
  if (targetView && targetNavItem) {
    targetView.classList.add('active');
    targetNavItem.classList.add('active');
    
    // Refresh targeted screen content
    if (tabId === 'home') renderHome();
    if (tabId === 'planning') renderPlanning();
    if (tabId === 'progress') renderProgress();
    if (tabId === 'organizer') renderOrganizer();
    if (tabId === 'profile') renderProfile();
  }
}

// Date helpers
function getTodayDateKey() {
  const d = new Date();
  const y = d.getFullYear();
  const m = String(d.getMonth() + 1).padStart(2, '0');
  const day = String(d.getDate()).padStart(2, '0');
  return `${y}-${m}-${day}`;
}

function getTodayWeekdayRaw() {
  // Calendar: Sunday = 1, Monday = 2...
  return new Date().getDay() + 1;
}

// Filter today's tasks
function getTodayTemplates() {
  const todayRaw = getTodayWeekdayRaw();
  return state.templates
    .filter(t => t.dayOfWeekRaw === todayRaw)
    .sort((a, b) => {
      const timeA = a.startHour * 60 + a.startMinute;
      const timeB = b.startHour * 60 + b.startMinute;
      return timeA - timeB;
    });
}

function getStatusForToday(templateId) {
  const todayKey = getTodayDateKey();
  const log = state.logs.find(l => l.templateId === templateId && l.dateKey === todayKey);
  return log ? log.status : 'pending';
}

// Render Dashboard View (Accueil)
function renderHome() {
  // Translate static text elements
  document.getElementById('home-title').textContent = t('tabHome');
  document.getElementById('home-welcome').textContent = t('welcome', { name: state.user_pseudo });
  document.getElementById('home-quote').textContent = state.user_quote;
  document.getElementById('home-progress-title').textContent = t('dailyProgressTitle');
  document.getElementById('home-activities-title').textContent = t('activitiesToday');
  document.getElementById('home-avatar').textContent = state.user_avatar;
  
  const todayList = getTodayTemplates();
  const listContainer = document.getElementById('home-activities-list');
  listContainer.innerHTML = '';
  
  let doneCount = 0;
  
  if (todayList.length === 0) {
    listContainer.innerHTML = `
      <div class="glass-card empty-state">
        <div class="empty-state-icon">📅</div>
        <div class="section-title">${t('noActivitiesToday')}</div>
        <div class="empty-state-text">${t('goToPlanning')}</div>
      </div>
    `;
  } else {
    todayList.forEach(template => {
      const status = getStatusForToday(template.id);
      if (status === 'done') doneCount++;
      
      const card = document.createElement('div');
      card.className = `glass-card activity-card ${status === 'done' ? 'done' : ''}`;
      
      const categoryLabelText = t(template.categoryRaw);
      
      card.innerHTML = `
        <div class="category-bar" style="background: ${template.colorHex}"></div>
        <div class="activity-icon-wrap" style="background: ${hexToRgba(template.colorHex, 0.15)}; color: ${template.colorHex}">
          ${template.iconName}
        </div>
        <div class="activity-detail-wrap">
          <div class="activity-name">${template.name}</div>
          <div class="activity-meta">
            <span class="activity-time-tag" style="background: ${hexToRgba(template.colorHex, 0.1)}; color: ${template.colorHex}">
              ${String(template.startHour).padStart(2, '0')}h${String(template.startMinute).padStart(2, '0')}
            </span>
            <span>•</span>
            <span>${categoryLabelText}</span>
          </div>
          ${template.note ? `<div class="activity-note">${template.note}</div>` : ''}
        </div>
        <div class="activity-actions">
          <button class="action-btn done-btn ${status === 'done' ? 'active' : ''}" onclick="updateTaskStatus('${template.id}', 'done')">✓</button>
          <button class="action-btn notdone-btn ${status === 'notDone' ? 'active' : ''}" onclick="updateTaskStatus('${template.id}', 'notDone')">✗</button>
          <button class="action-btn postpone-btn ${status === 'postponed' ? 'active' : ''}" onclick="updateTaskStatus('${template.id}', 'postponed')">➔</button>
        </div>
      `;
      listContainer.appendChild(card);
    });
  }
  
  // Render Circular Ring Percentage
  const percentage = todayList.length > 0 ? Math.round((doneCount / todayList.length) * 100) : 0;
  document.getElementById('home-percentage-text').textContent = `${percentage}%`;
  
  const ring = document.getElementById('home-progress-ring');
  const circumference = 251.2; // 2 * PI * r (r=40)
  const offset = circumference - (percentage / 100) * circumference;
  ring.style.strokeDashoffset = offset;
  
  document.getElementById('home-progress-count').textContent = t('tasksDone', { done: doneCount, total: todayList.length });
  
  // Update coaching tips text
  let enc = t('encouragement0');
  if (percentage > 0 && percentage < 40) enc = t('encouragementLow');
  else if (percentage >= 40 && percentage < 75) enc = t('encouragementMid');
  else if (percentage >= 75 && percentage < 100) enc = t('encouragementHigh');
  else if (percentage === 100 && todayList.length > 0) enc = t('encouragementPerfect');
  
  document.getElementById('home-progress-encouragement').textContent = enc;
}

// Log status on action click
function updateTaskStatus(templateId, status) {
  const todayKey = getTodayDateKey();
  const existingLogIndex = state.logs.findIndex(l => l.templateId === templateId && l.dateKey === todayKey);
  
  if (existingLogIndex > -1) {
    state.logs[existingLogIndex].status = status;
  } else {
    state.logs.push({
      id: generateUUID(),
      templateId: templateId,
      dateKey: todayKey,
      date: new Date().toISOString(),
      status: status
    });
  }
  
  savePlanner();
  renderHome();
  
  // Spark confetti and alert toast if marked as done
  if (status === 'done') {
    triggerConfetti();
    showToast(t('victoryToast'));
  }
}

// Canvas-based particles system for rewards
function triggerConfetti() {
  const canvas = document.getElementById('confetti-canvas');
  if (!canvas) return;
  
  const ctx = canvas.getContext('2d');
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  
  let particles = [];
  const colors = ['#FF006E', '#7209B7', '#3A86F0', '#38B000', '#FF7B00', '#FFB703'];
  
  for (let i = 0; i < 65; i++) {
    particles.push({
      x: canvas.width / 2 + (Math.random() - 0.5) * 60,
      y: canvas.height + 20,
      vx: (Math.random() - 0.5) * 7,
      vy: -14 - Math.random() * 10,
      size: 6 + Math.random() * 8,
      color: colors[Math.floor(Math.random() * colors.length)],
      rotation: Math.random() * 360,
      rotationSpeed: (Math.random() - 0.5) * 8,
      shape: Math.floor(Math.random() * 3) // 0: circle, 1: rect, 2: triangle
    });
  }
  
  let frame = 0;
  function animate() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    let alive = false;
    
    particles.forEach(p => {
      p.x += p.vx;
      p.y += p.vy;
      p.vy += 0.38; // gravity
      p.rotation += p.rotationSpeed;
      
      if (p.y < canvas.height + 20) {
        alive = true;
        ctx.save();
        ctx.translate(p.x, p.y);
        ctx.rotate(p.rotation * Math.PI / 180);
        ctx.fillStyle = p.color;
        
        ctx.beginPath();
        if (p.shape === 0) {
          ctx.arc(0, 0, p.size / 2, 0, Math.PI * 2);
        } else if (p.shape === 1) {
          ctx.fillRect(-p.size / 2, -p.size / 2, p.size, p.size);
        } else {
          ctx.moveTo(0, -p.size / 2);
          ctx.lineTo(p.size / 2, p.size / 2);
          ctx.lineTo(-p.size / 2, p.size / 2);
          ctx.closePath();
        }
        ctx.fill();
        ctx.restore();
      }
    });
    
    frame++;
    if (alive && frame < 110) {
      requestAnimationFrame(animate);
    } else {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
    }
  }
  animate();
}

// Render Weekly Planner (Planning)
function renderPlanning() {
  document.getElementById('planning-title').textContent = t('tabPlanning');
  
  // Render Day Carousel
  const carousel = document.getElementById('planning-days-carousel');
  carousel.innerHTML = '';
  
  // Monday-Sunday sequence
  const cases = [2, 3, 4, 5, 6, 7, 1];
  const shortNames = {
    2: t('monShort'), 3: t('tueShort'), 4: t('wedShort'),
    5: t('thuShort'), 6: t('friShort'), 7: t('satShort'), 1: t('sunShort')
  };
  
  cases.forEach(dayRaw => {
    const isSelected = dayRaw === state.selectedDay;
    const bubble = document.createElement('div');
    bubble.className = `day-bubble ${isSelected ? 'active' : ''}`;
    bubble.onclick = () => {
      state.selectedDay = dayRaw;
      renderPlanning();
    };
    
    const dayLabel = t(dayRaw);
    
    bubble.innerHTML = `
      <span class="day-bubble-short">${shortNames[dayRaw]}</span>
      <span class="day-bubble-letter">${dayLabel.substring(0, 1)}</span>
    `;
    carousel.appendChild(bubble);
  });
  
  // Render selected day activities
  const dayNameText = t(state.selectedDay);
  
  const dayTemplates = state.templates
    .filter(t => t.dayOfWeekRaw === state.selectedDay)
    .sort((a, b) => (a.startHour * 60 + a.startMinute) - (b.startHour * 60 + b.startMinute));
    
  document.getElementById('planning-day-header').textContent = t('myPlanning', { day: dayNameText });
  document.getElementById('planning-day-count').textContent = t('activitiesCount', { count: dayTemplates.length });
  
  const listContainer = document.getElementById('planning-activities-list');
  listContainer.innerHTML = '';
  
  if (dayTemplates.length === 0) {
    listContainer.innerHTML = `
      <div class="glass-card empty-state">
        <div class="empty-state-icon">📝</div>
        <div class="section-title">${t('noActivitiesDay')}</div>
        <div class="empty-state-text">${t('createTimeBlocks')}</div>
      </div>
    `;
  } else {
    dayTemplates.forEach(template => {
      const card = document.createElement('div');
      card.className = "glass-card activity-card planning-card";
      card.onclick = () => openAddModal(template.id);
      
      const categoryLabelText = t(template.categoryRaw);
      
      let reminderText = '';
      if (template.reminderOffsetMinutes >= 0) {
        let text = t('atExactTime');
        if (template.reminderOffsetMinutes > 0) {
          text = t('minsBefore', { mins: template.reminderOffsetMinutes });
        }
        reminderText = `
          <div style="font-size: 0.65rem; color: var(--text-secondary); margin-top: 4px; display: flex; align-items: center; gap: 3px;">
            🔔 ${text}
          </div>
        `;
      }
      
      card.innerHTML = `
        <div class="category-bar" style="background: ${template.colorHex}"></div>
        <div class="activity-icon-wrap" style="background: ${hexToRgba(template.colorHex, 0.12)}; color: ${template.colorHex}">
          ${template.iconName}
        </div>
        <div class="activity-detail-wrap">
          <div class="activity-name">${template.name}</div>
          <div class="activity-meta">
            <span class="activity-time-tag" style="background: ${hexToRgba(template.colorHex, 0.1)}; color: ${template.colorHex}">
              ${String(template.startHour).padStart(2, '0')}h${String(template.startMinute).padStart(2, '0')} - ${String(template.endHour).padStart(2, '0')}h${String(template.endMinute).padStart(2, '0')}
            </span>
          </div>
          ${reminderText}
        </div>
        <span class="category-chip" style="background: ${template.colorHex}">${categoryLabelText}</span>
      `;
      listContainer.appendChild(card);
    });
  }
}

// Open Form Modal (Add / Edit)
function openAddModal(templateId = null) {
  state.editingTemplateId = templateId;
  const modal = document.getElementById('modal-activity');
  modal.classList.add('active');
  
  // Populate form fields
  const title = document.getElementById('modal-title');
  const deleteBtn = document.getElementById('form-delete-btn');
  
  // Translate modal labels
  document.getElementById('label-gen-info').textContent = t('generalInfo');
  document.getElementById('form-name').placeholder = t('activityNamePlaceholder');
  document.getElementById('label-weekday').textContent = t('weekdayLabel');
  document.getElementById('label-note').textContent = t('optionalNote');
  document.getElementById('label-hours').textContent = t('hoursSection');
  document.getElementById('label-start').textContent = t('startTimeLabel');
  document.getElementById('label-end').textContent = t('endTimeLabel');
  document.getElementById('label-category').textContent = t('categoryLabel');
  document.getElementById('label-style').textContent = t('styleSection');
  document.getElementById('label-custom-icon').textContent = t('customIconLabel');
  document.getElementById('label-custom-color').textContent = t('customColorLabel');
  document.getElementById('label-reminder').textContent = t('reminderSection');
  document.getElementById('label-notify').textContent = t('notifyMe');
  
  document.getElementById('btn-cancel-modal').textContent = t('cancelBtn');
  document.getElementById('btn-save-modal').textContent = t('saveBtn');
  deleteBtn.textContent = t('deleteBtn');
  
  // Populate Weekday Select Options
  const weekdaySelect = document.getElementById('form-weekday');
  weekdaySelect.innerHTML = '';
  [2, 3, 4, 5, 6, 7, 1].forEach(raw => {
    const opt = document.createElement('option');
    opt.value = raw;
    opt.textContent = t(raw);
    weekdaySelect.appendChild(opt);
  });
  
  // Populate Category Select Options
  const categorySelect = document.getElementById('form-category');
  categorySelect.innerHTML = '';
  CATEGORIES.forEach(cat => {
    const opt = document.createElement('option');
    opt.value = cat;
    opt.textContent = t(cat);
    categorySelect.appendChild(opt);
  });
  
  // Populate Reminder Select Options
  const reminderSelect = document.getElementById('form-reminder');
  reminderSelect.innerHTML = `
    <option value="-1">${t('noReminder')}</option>
    <option value="0">${t('atExactTime')}</option>
    <option value="5">${t('minsBefore', { mins: 5 })}</option>
    <option value="10">${t('minsBefore', { mins: 10 })}</option>
    <option value="30">${t('minsBefore', { mins: 30 })}</option>
  `;
  
  // Populate Color Options Grid
  const colorGrid = document.getElementById('form-color-grid');
  colorGrid.innerHTML = '';
  THEME_COLORS.forEach(hex => {
    const el = document.createElement('div');
    el.className = "color-option";
    el.style.background = hex;
    el.onclick = () => selectFormColor(hex);
    colorGrid.appendChild(el);
  });
  
  // Populate Icon Options Grid
  const iconGrid = document.getElementById('form-icon-grid');
  iconGrid.innerHTML = '';
  ICONS.forEach(emoji => {
    const el = document.createElement('div');
    el.className = "icon-option";
    el.textContent = emoji;
    el.onclick = () => selectFormIcon(emoji);
    iconGrid.appendChild(el);
  });
  
  if (templateId) {
    title.textContent = t('editActivity');
    deleteBtn.style.display = 'block';
    
    const template = state.templates.find(t => t.id === templateId);
    document.getElementById('form-name').value = template.name;
    document.getElementById('form-weekday').value = template.dayOfWeekRaw;
    document.getElementById('form-start-time').value = `${String(template.startHour).padStart(2, '0')}:${String(template.startMinute).padStart(2, '0')}`;
    document.getElementById('form-end-time').value = `${String(template.endHour).padStart(2, '0')}:${String(template.endMinute).padStart(2, '0')}`;
    document.getElementById('form-category').value = template.categoryRaw;
    document.getElementById('form-note').value = template.note;
    document.getElementById('form-reminder').value = template.reminderOffsetMinutes;
    
    selectFormColor(template.colorHex);
    selectFormIcon(template.iconName);
  } else {
    title.textContent = t('addActivity');
    deleteBtn.style.display = 'none';
    
    // Set defaults
    document.getElementById('form-name').value = '';
    document.getElementById('form-weekday').value = state.selectedDay;
    document.getElementById('form-start-time').value = '08:00';
    document.getElementById('form-end-time').value = '09:00';
    document.getElementById('form-category').value = 'ecole';
    document.getElementById('form-note').value = '';
    document.getElementById('form-reminder').value = '-1';
    
    selectFormColor(CATEGORY_MAP.ecole.color);
    selectFormIcon(CATEGORY_MAP.ecole.emoji);
  }
}

function selectFormColor(hex) {
  document.querySelectorAll('.color-option').forEach(el => {
    if (el.style.backgroundColor === hexToRgba(hex).replace(/\s/g, '') || el.style.backgroundColor === hex || el.style.background === hex) {
      el.classList.add('active');
    } else {
      el.classList.remove('active');
    }
  });
  state.selectedFormColor = hex;
}

function selectFormIcon(emoji) {
  document.querySelectorAll('.icon-option').forEach(el => {
    if (el.textContent === emoji) {
      el.classList.add('active');
    } else {
      el.classList.remove('active');
    }
  });
  state.selectedFormIcon = emoji;
}

// Save Modal Activity
function saveFormActivity() {
  const name = document.getElementById('form-name').value.trim();
  const weekday = parseInt(document.getElementById('form-weekday').value);
  const startTime = document.getElementById('form-start-time').value;
  const endTime = document.getElementById('form-end-time').value;
  const category = document.getElementById('form-category').value;
  const note = document.getElementById('form-note').value.trim();
  const reminder = parseInt(document.getElementById('form-reminder').value);
  
  if (!name) return;
  
  const startParts = startTime.split(':');
  const endParts = endTime.split(':');
  
  const startHour = parseInt(startParts[0]);
  const startMinute = parseInt(startParts[1]);
  const endHour = parseInt(endParts[0]);
  const endMinute = parseInt(endParts[1]);
  
  if (startHour * 60 + startMinute >= endHour * 60 + endMinute) {
    alert("L'heure de début doit être antérieure à l'heure de fin !");
    return;
  }
  
  if (state.editingTemplateId) {
    const idx = state.templates.findIndex(t => t.id === state.editingTemplateId);
    state.templates[idx] = {
      ...state.templates[idx],
      name: name,
      dayOfWeekRaw: weekday,
      startHour: startHour,
      startMinute: startMinute,
      endHour: endHour,
      endMinute: endMinute,
      categoryRaw: category,
      colorHex: state.selectedFormColor,
      iconName: state.selectedFormIcon,
      note: note,
      reminderOffsetMinutes: reminder
    };
  } else {
    state.templates.push({
      id: generateUUID(),
      name: name,
      dayOfWeekRaw: weekday,
      startHour: startHour,
      startMinute: startMinute,
      endHour: endHour,
      endMinute: endMinute,
      categoryRaw: category,
      colorHex: state.selectedFormColor,
      iconName: state.selectedFormIcon,
      note: note,
      reminderOffsetMinutes: reminder
    });
  }
  
  savePlanner();
  closeModal();
  renderPlanning();
}

function deleteFormActivity() {
  if (state.editingTemplateId) {
    state.templates = state.templates.filter(t => t.id !== state.editingTemplateId);
    savePlanner();
    closeModal();
    renderPlanning();
  }
}

function closeModal() {
  document.getElementById('modal-activity').classList.remove('active');
}

// Render Statistics View (Progression)
function renderProgress() {
  document.getElementById('progress-title').textContent = t('tabProgress');
  
  // Calculate streaks
  const streak = calculateCurrentStreak();
  document.getElementById('progress-streak-value').textContent = streak;
  document.getElementById('progress-streak-label').textContent = t('streakLabel');
  
  // Calculate weekly rate
  const rate = calculateWeeklySuccessRate();
  document.getElementById('progress-weekly-value').textContent = `${rate}%`;
  document.getElementById('progress-weekly-label').textContent = t('weeklySuccessLabel');
  
  // Calculate breakdown for today
  const todayLogs = state.logs.filter(l => l.dateKey === getTodayDateKey());
  const done = todayLogs.filter(l => l.status === 'done').count || todayLogs.filter(l => l.status === 'done').length;
  const notDone = todayLogs.filter(l => l.status === 'notDone').length;
  const postponed = todayLogs.filter(l => l.status === 'postponed').length;
  
  document.getElementById('progress-today-title').textContent = t('todayBreakdownTitle');
  
  document.getElementById('progress-done-val').textContent = done;
  document.getElementById('progress-done-lbl').textContent = t('statusDoneLabel');
  
  document.getElementById('progress-notdone-val').textContent = notDone;
  document.getElementById('progress-notdone-lbl').textContent = t('statusNotDoneLabel');
  
  document.getElementById('progress-postponed-val').textContent = postponed;
  document.getElementById('progress-postponed-lbl').textContent = t('statusPostponedLabel');
  
  // Render coaching block
  document.getElementById('progress-coach-title').textContent = t('coachAdviceTitle');
  document.getElementById('progress-coach-text').textContent = getCoachingAdvice(rate);
  
  // Render Category Bar Chart
  document.getElementById('progress-chart-title').textContent = t('chartTitle');
  const chartContainer = document.getElementById('progress-category-chart');
  chartContainer.innerHTML = '';
  
  // Count category done logs
  const counts = {};
  state.logs.forEach(log => {
    if (log.status === 'done') {
      const template = state.templates.find(t => t.id === log.templateId);
      if (template) {
        counts[template.categoryRaw] = (counts[template.categoryRaw] || 0) + 1;
      }
    }
  });
  
  const chartData = CATEGORIES.map(cat => ({
    name: t(cat),
    count: counts[cat] || 0,
    color: CATEGORY_MAP[cat].color
  })).filter(item => item.count > 0);
  
  if (chartData.length === 0) {
    chartContainer.innerHTML = `
      <div style="text-align: center; color: var(--text-secondary); font-size: 0.8rem; padding: 20px 0;">
        ⚠️ ${t('noChartData')}
      </div>
    `;
  } else {
    const maxVal = Math.max(...chartData.map(d => d.count));
    chartData.forEach(item => {
      const percentageWidth = Math.round((item.count / maxVal) * 100);
      const row = document.createElement('div');
      row.className = "chart-row";
      row.innerHTML = `
        <span class="chart-label">${item.name}</span>
        <div class="chart-bar-bg">
          <div class="chart-bar-fill" style="background: ${item.color}; width: ${percentageWidth}%"></div>
        </div>
        <span class="chart-value">${item.count}</span>
      `;
      chartContainer.appendChild(row);
    });
  }
}

// Calculate streak
function calculateCurrentStreak() {
  let streak = 0;
  let offset = 0;
  
  while (true) {
    const checkDate = new Date();
    checkDate.setDate(checkDate.getDate() - offset);
    
    const y = checkDate.getFullYear();
    const m = String(checkDate.getMonth() + 1).padStart(2, '0');
    const day = String(checkDate.getDate()).padStart(2, '0');
    const dayKey = `${y}-${m}-${day}`;
    
    // Check if tasks were scheduled for this day
    const weekdayRaw = checkDate.getDay() + 1;
    const scheduledForDay = state.templates.filter(t => t.dayOfWeekRaw === weekdayRaw);
    
    if (scheduledForDay.length === 0) {
      offset++;
      if (offset > 100) break; // Avoid loop hang
      continue;
    }
    
    const dayLogs = state.logs.filter(l => l.dateKey === dayKey);
    const doneCount = dayLogs.filter(l => l.status === 'done').length;
    
    if (offset === 0 && dayLogs.length === 0) {
      // today not done yet, continue check yesterday
      offset++;
      continue;
    }
    
    // Successful day is defined as doneCount >= scheduledForDay / 2
    if (doneCount > 0 && doneCount >= (scheduledForDay.length / 2)) {
      streak++;
      offset++;
    } else {
      break;
    }
  }
  
  return streak;
}

// Success rate of last 7 days
function calculateWeeklySuccessRate() {
  let totalInWeek = 0;
  let doneInWeek = 0;
  
  for (let offset = 0; offset < 7; offset++) {
    const checkDate = new Date();
    checkDate.setDate(checkDate.getDate() - offset);
    
    const y = checkDate.getFullYear();
    const m = String(checkDate.getMonth() + 1).padStart(2, '0');
    const day = String(checkDate.getDate()).padStart(2, '0');
    const dayKey = `${y}-${m}-${day}`;
    
    const weekdayRaw = checkDate.getDay() + 1;
    const scheduled = state.templates.filter(t => t.dayOfWeekRaw === weekdayRaw);
    
    if (scheduled.length === 0) continue;
    
    const dayLogs = state.logs.filter(l => l.dateKey === dayKey);
    
    scheduled.forEach(t => {
      totalInWeek++;
      const log = dayLogs.find(l => l.templateId === t.id);
      if (log && log.status === 'done') doneInWeek++;
    });
  }
  
  return totalInWeek > 0 ? Math.round((doneInWeek / totalInWeek) * 100) : 0;
}

function getCoachingAdvice(rate) {
  if (state.templates.length === 0) {
    return state.lang === 'fr' 
      ? "Planifie tes premières activités pour commencer à suivre ta progression !"
      : "Schedule your first activities to start tracking your progress!";
  }
  
  if (rate === 0) {
    return state.lang === 'fr'
      ? "Commence par marquer tes activités terminées aujourd'hui. Chaque pas compte !"
      : "Start by marking today's activities as completed. Every step counts!";
  } else if (rate >= 80) {
    return state.lang === 'fr'
      ? `Tu es sur une excellente lancée, ${state.user_pseudo} ! Reste régulier et protège ton sommeil.`
      : `You are on an excellent run, ${state.user_pseudo}! Stay consistent and protect your sleep.`;
  } else if (rate >= 50) {
    return state.lang === 'fr'
      ? "C'est pas mal ! Essaie de planifier tes blocs les plus exigeants aux heures où tu as le plus d'énergie."
      : "Not bad! Try to schedule your most demanding blocks at times when you have the most energy.";
  } else {
    return state.lang === 'fr'
      ? "Ne te décourage pas ! Essaie d'alléger un peu ton planning en planifiant plus de créneaux de 'Repos'."
      : "Don't get discouraged! Try to lighten your schedule a bit by planning more 'Rest' slots.";
  }
}

// Render Assistant AI Chat
function renderOrganizer() {
  document.getElementById('organizer-title').textContent = t('tabOrganizer');
  
  const history = document.getElementById('chat-history');
  history.innerHTML = '';
  
  if (state.chats.length === 0) {
    history.innerHTML = `
      <div class="glass-card welcome-card" style="text-align: center; display: flex; flex-direction: column; gap: 10px; padding: 25px; margin: 15px 0;">
        <span style="font-size: 2.2rem;">✨</span>
        <div class="section-title">${t('tabOrganizer')} AI</div>
        <div class="empty-state-text">
          ${state.lang === 'fr' 
            ? "Je suis ton assistant personnel local. Pose-moi n'importe quelle question sur ton planning ou ta motivation !" 
            : "I am your local personal assistant. Ask me any question about your schedule or motivation!"}
        </div>
      </div>
    `;
  } else {
    state.chats.forEach(msg => {
      const bubbleRow = document.createElement('div');
      bubbleRow.className = `chat-bubble-row ${msg.isUser ? 'user' : 'ai'}`;
      bubbleRow.innerHTML = `
        <div class="glass-card chat-bubble">${msg.text}</div>
      `;
      history.appendChild(bubbleRow);
    });
  }
  
  // Render suggestion chips
  const chipsContainer = document.getElementById('chat-suggestions');
  chipsContainer.innerHTML = '';
  
  const suggs = state.lang === 'fr' ? [
    "📊 Analyse ma semaine",
    "💡 Conseil de discipline",
    "📚 Aide devoirs",
    "😴 Fatigué"
  ] : [
    "📊 Analyze my week",
    "💡 Discipline advice",
    "📚 Homework help",
    "😴 Feeling tired"
  ];
  
  suggs.forEach(sug => {
    const chip = document.createElement('div');
    chip.className = "suggestion-chip";
    chip.textContent = sug;
    chip.onclick = () => submitChatMessage(sug);
    chipsContainer.appendChild(chip);
  });
  
  scrollToBottom();
}

function submitChatMessage(text) {
  if (!text.trim()) return;
  
  // Insert user message
  state.chats.push({ text: text, isUser: true, timestamp: Date.now() });
  saveChats();
  renderOrganizer();
  
  // Show writing animation
  const history = document.getElementById('chat-history');
  const typingBubble = document.createElement('div');
  typingBubble.className = "chat-bubble-row ai typing-row";
  typingBubble.innerHTML = `
    <div class="glass-card chat-bubble">
      <div class="typing-dots">
        <span></span><span></span><span></span>
      </div>
    </div>
  `;
  history.appendChild(typingBubble);
  scrollToBottom();
  
  // Delayed simulated response
  setTimeout(() => {
    // Delete typing row
    document.querySelectorAll('.typing-row').forEach(el => el.remove());
    
    // Generate coaching response
    const reply = generateCoachingReply(text);
    state.chats.push({ text: reply, isUser: false, timestamp: Date.now() });
    saveChats();
    renderOrganizer();
  }, 1200);
}

// Offline AI coaching logic matching AssistantService.swift
function generateCoachingReply(query) {
  const input = query.toLowerCase();
  const pseudo = state.user_pseudo;
  
  // Count statistics
  const totalAct = state.templates.length;
  const doneLogs = state.logs.filter(l => l.status === 'done');
  const notDoneLogs = state.logs.filter(l => l.status === 'notDone');
  const postponedLogs = state.logs.filter(l => l.status === 'postponed');
  const totalLogs = doneLogs.length + notDoneLogs.length + postponedLogs.length;
  const rate = totalLogs > 0 ? Math.round((doneLogs.length / totalLogs) * 100) : 0;
  
  if (state.lang === 'fr') {
    if (input.includes('bonjour') || input.includes('salut') || input.includes('cc') || input.includes('hello')) {
      return `Salut ${pseudo} ! 👋 Je suis l'Organisateur, ton coach personnel. Tu peux me demander d'analyser ta semaine, des astuces pour vaincre la flemme ou comment gérer tes devoirs !`;
    }
    
    if (input.includes('analyse') || input.includes('stat') || input.includes('bilan') || input.includes('semaine')) {
      let advice = `📊 **Analyse de ton planning, ${pseudo} :**\n\n`;
      advice += `• Tu as **${totalAct}** activités configurées dans ta semaine.\n`;
      if (totalLogs > 0) {
        advice += `• Tu as enregistré **${totalLogs}** validations.\n`;
        advice += `• Ton taux de réussite est de **${rate}%** (${doneLogs.length} faites, ${notDoneLogs.length} ratées).\n\n`;
        if (rate >= 80) advice += "🔥 Score incroyable ! Tu as une discipline d'acier, continue !";
        else if (rate >= 50) advice += "⚡️ C'est honorable, mais évite d'accumuler trop de tâches ratées.";
        else advice += "⚠️ Attention à la surcharge. Essaie de réduire la durée de tes blocs.";
      } else {
        advice += `• Tu n'as pas encore validé de tâches. Coche tes premières activités sur la page d'Accueil !`;
      }
      return advice;
    }
    
    if (input.includes('discipline') || input.includes('flemme') || input.includes('motiver') || input.includes('motivation')) {
      return `💡 **Conseils de discipline pour ${pseudo} :**\n\n` +
        `1. **Règle des 2 minutes** : Lance-toi pour juste 2 minutes. La plupart du temps, l'action déclenche la motivation !\n\n` +
        `2. **Retire les distractions** : Cache ton téléphone dans une autre pièce pendant tes séances d'étude.\n\n` +
        `3. **Identifie ton 'Pourquoi'** : Pourquoi veux-tu finir cette tâche ? Reste aligné sur tes objectifs.`;
    }
    
    if (input.includes('devoir') || input.includes('ecole') || input.includes('école') || input.includes('travail')) {
      return `📚 **Conseils d'étude :**\n\nPlanifie des sessions courtes de **30 à 45 minutes** suivies de 5 minutes de pause complète. C'est idéal pour que ton cerveau reste à 100% de ses capacités.`;
    }
    
    if (input.includes('fatigue') || input.includes('repos') || input.includes('sommeil') || input.includes('dormir')) {
      return `😴 **Récupération :**\n\nUn corps fatigué ne peut pas être discipliné. Vise au moins 8h de sommeil. Essaie d'ajouter des créneaux de 'Repos' dans ton planning après le sport ou le travail scolaire.`;
    }
    
    return `Je t'entends, ${pseudo}. 🤔 La régularité est le secret de la réussite. Demande-moi d'analyser ton planning ('analyse') ou écris 'discipline' pour avoir des conseils de motivation !`;
  } else {
    // English responses
    if (input.includes('hello') || input.includes('hi') || input.includes('hey') || input.includes('hola')) {
      return `Hello ${pseudo}! 👋 I am your Organizer, your personal coach. You can ask me to analyze your week, tips to defeat laziness, or how to manage your homework!`;
    }
    
    if (input.includes('analyze') || input.includes('stat') || input.includes('week') || input.includes('progress')) {
      let advice = `📊 **Week analysis for ${pseudo}:**\n\n`;
      advice += `• You have **${totalAct}** weekly activities scheduled.\n`;
      if (totalLogs > 0) {
        advice += `• You recorded **${totalLogs}** task status logs.\n`;
        advice += `• Your success rate is **${rate}%** (${doneLogs.length} done, ${notDoneLogs.length} missed).\n\n`;
        if (rate >= 80) advice += "🔥 Incredible score! You have iron discipline, keep it up!";
        else if (rate >= 50) advice += "⚡️ Good job, but try to avoid missing too many activities.";
        else advice += "⚠️ Warning: Potential burnout. Try shortening your work blocks.";
      } else {
        advice += `• No tasks completed yet. Mark your first activities on the Home screen!`;
      }
      return advice;
    }
    
    if (input.includes('discipline') || input.includes('lazy') || input.includes('motivate') || input.includes('motivation')) {
      return `💡 **Discipline advice for ${pseudo}:**\n\n` +
        `1. **The 2-Minute Rule**: Start the task for just 2 minutes. Usually, starting is the hardest part!\n\n` +
        `2. **Remove Distractions**: Put your phone in another room while working.\n\n` +
        `3. **Reward yourself**: Treat yourself to something nice after completing a tough task.`;
    }
    
    if (input.includes('homework') || input.includes('school') || input.includes('study') || input.includes('work')) {
      return `📚 **Study tips:**\n\nTry the **Pomodoro** technique: 25 minutes of intense focus followed by 5 minutes of deep rest. No phone during work blocks!`;
    }
    
    if (input.includes('tired') || input.includes('rest') || input.includes('sleep') || input.includes('fatigue')) {
      return `😴 **Recovery:**\n\nDiscipline requires energy. Aim for 8 hours of sleep. Plan specific 'Rest' blocks in your weekly schedule to recharge.`;
    }
    
    return `I hear you, ${pseudo}. 🤔 Consistency is key. Type 'analyze' to see your metrics or 'discipline' to get motivational tips!`;
  }
}

function scrollToBottom() {
  const history = document.getElementById('chat-history');
  history.scrollTop = history.scrollHeight;
}

function handleChatSubmit(e) {
  e.preventDefault();
  const input = document.getElementById('chat-input-text');
  const text = input.value.trim();
  if (text) {
    submitChatMessage(text);
    input.value = '';
  }
}

// Render Profile & Customization screen
function renderProfile() {
  document.getElementById('profile-title').textContent = t('tabProfile');
  document.getElementById('label-identity').textContent = t('identitySection');
  document.getElementById('label-pseudo').textContent = t('pseudoLabel');
  document.getElementById('label-quote').textContent = t('quoteLabel');
  document.getElementById('label-avatar-section').textContent = t('avatarSection');
  document.getElementById('label-theme-section').textContent = t('visualThemeSection');
  document.getElementById('label-color-section').textContent = t('appColorSection');
  document.getElementById('label-settings-section').textContent = t('settingsSection');
  document.getElementById('label-reminders').textContent = t('systemReminders');
  document.getElementById('label-notify-auth').textContent = t('authNotifications');
  document.getElementById('label-notify-state').textContent = ('Notification' in window && Notification.permission === 'granted') ? 'Granted ✅' : 'Required ❌';
  document.getElementById('btn-test-reminder').textContent = t('testReminderBtn');
  document.getElementById('label-local-data').textContent = t('localDataSection');
  document.getElementById('label-temp-count').textContent = t('templatesCountLabel');
  document.getElementById('val-temp-count').textContent = state.templates.length;
  document.getElementById('label-log-count').textContent = t('historyCountLabel');
  document.getElementById('val-log-count').textContent = state.logs.length;
  document.getElementById('btn-export').innerHTML = `⚙️ ${t('exportDataBtn')}`;
  document.getElementById('label-danger-zone').textContent = t('dangerZone');
  document.getElementById('btn-reset').textContent = t('resetAppBtn');
  
  // Set Input Values
  document.getElementById('profile-pseudo-input').value = state.user_pseudo;
  document.getElementById('profile-quote-input').value = state.user_quote;
  
  // Render Live Preview Card
  document.getElementById('preview-avatar').textContent = state.user_avatar;
  document.getElementById('preview-pseudo').textContent = state.user_pseudo;
  document.getElementById('preview-quote').textContent = state.user_quote;
  document.getElementById('preview-avatar').style.color = state.theme_color;
  document.getElementById('preview-avatar-bg').style.background = hexToRgba(state.theme_color, 0.15);
  
  // Render Lang Button text
  document.getElementById('lang-toggle-btn').textContent = state.lang === 'fr' ? 'FR 🇫🇷' : 'EN 🇬🇧';
  
  // Render Avatar select list
  const avatarsBox = document.getElementById('profile-avatar-grid');
  avatarsBox.innerHTML = '';
  AVATARS.forEach(emoji => {
    const isSel = emoji === state.user_avatar;
    const btn = document.createElement('button');
    btn.className = `icon-option ${isSel ? 'active' : ''}`;
    btn.style.fontSize = '1.35rem';
    btn.textContent = emoji;
    btn.onclick = () => {
      state.user_avatar = emoji;
      saveProfile();
      renderProfile();
      renderHome();
    };
    avatarsBox.appendChild(btn);
  });
  
  // Render Colors select list
  const colorsBox = document.getElementById('profile-color-grid');
  colorsBox.innerHTML = '';
  THEME_COLORS.forEach(hex => {
    const isSel = hex === state.theme_color;
    const circle = document.createElement('div');
    circle.className = `color-option ${isSel ? 'active' : ''}`;
    circle.style.backgroundColor = hex;
    circle.onclick = () => {
      state.theme_color = hex;
      saveProfile();
      applyTheme();
      renderProfile();
      renderHome();
    };
    colorsBox.appendChild(circle);
  });
  
  // Render Themes list
  const themesBox = document.getElementById('profile-themes-list');
  themesBox.innerHTML = '';
  THEME_NAMES.forEach(name => {
    const isSel = name === state.theme_name;
    const btn = document.createElement('div');
    btn.className = "list-row glass-card";
    btn.style.cursor = 'pointer';
    btn.onclick = () => {
      state.theme_name = name;
      saveProfile();
      applyTheme();
      renderProfile();
      renderHome();
    };
    btn.innerHTML = `
      <span style="font-weight: ${isSel ? '700' : '400'}">${name}</span>
      ${isSel ? `<span style="color: var(--primary-color);">✓</span>` : ''}
    `;
    themesBox.appendChild(btn);
  });
}

function handlePseudoChange(el) {
  state.user_pseudo = el.value.trim() || 'Champion';
  saveProfile();
  document.getElementById('preview-pseudo').textContent = state.user_pseudo;
}

function handleQuoteChange(el) {
  state.user_quote = el.value.trim() || 'Rien ne t\'arrête !';
  saveProfile();
  document.getElementById('preview-quote').textContent = state.user_quote;
}

// Toggle language FR/EN
function toggleLanguage() {
  state.lang = state.lang === 'fr' ? 'en' : 'fr';
  saveProfile();
  
  // Automatically adapt default quote
  if (state.lang === 'fr' && state.user_quote === "Nothing stops you! 🚀") {
    state.user_quote = "Rien ne t'arrête ! 🚀";
    saveProfile();
  } else if (state.lang === 'en' && state.user_quote === "Rien ne t'arrête ! 🚀") {
    state.user_quote = "Nothing stops you! 🚀";
    saveProfile();
  }
  
  // Translate dynamic UI elements
  translateTabs();
  renderProfile();
}

function translateTabs() {
  document.getElementById('nav-home-text').textContent = t('tabHome');
  document.getElementById('nav-planning-text').textContent = t('tabPlanning');
  document.getElementById('nav-progress-text').textContent = t('tabProgress');
  document.getElementById('nav-organizer-text').textContent = t('tabOrganizer');
  document.getElementById('nav-profile-text').textContent = t('tabProfile');
}

// Purge application database
function resetApp() {
  if (confirm(t('alertResetConfirm'))) {
    localStorage.clear();
    location.reload();
  }
}

// Request notification permission on click
function requestNotification() {
  if ('Notification' in window) {
    Notification.requestPermission().then(permission => {
      renderProfile();
    });
  }
}

// Trigger instant browser notifications after 5s
function sendTestNotification() {
  showToast(t('alertInstantTest'));
  setTimeout(() => {
    if ('Notification' in window && Notification.permission === 'granted') {
      new Notification("🚀 LifeFlow " + t('tabOrganizer'), {
        body: t('alertInstantTestBody'),
        icon: './icon-192.png'
      });
    } else {
      // Inline fallback alert if permission blocked
      alert("⏰ Dring ! " + t('alertInstantTestBody'));
    }
  }, 5000);
}

// Export PWA configuration locally (creates JSON file and triggers browser download)
function exportConfig() {
  const backup = {
    appName: "LifeFlow PWA",
    backupDate: new Date().toISOString(),
    lang: state.lang,
    user_pseudo: state.user_pseudo,
    user_avatar: state.user_avatar,
    user_quote: state.user_quote,
    theme_color: state.theme_color,
    theme_name: state.theme_name,
    templates: state.templates,
    logs: state.logs
  };
  
  const str = JSON.stringify(backup, null, 2);
  const blob = new Blob([str], { type: 'application/json' });
  const url = URL.createObjectURL(blob);
  
  const a = document.createElement('a');
  a.href = url;
  a.download = `lifeflow-backup-${getTodayDateKey()}.json`;
  a.click();
  URL.revokeObjectURL(url);
}

// Helpers
function generateUUID() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}

// App Initialization
window.addEventListener('DOMContentLoaded', () => {
  loadLocalData();
  applyTheme();
  translateTabs();
  
  // Set tab triggers
  document.getElementById('nav-home').onclick = () => navigateTo('home');
  document.getElementById('nav-planning').onclick = () => navigateTo('planning');
  document.getElementById('nav-progress').onclick = () => navigateTo('progress');
  document.getElementById('nav-organizer').onclick = () => navigateTo('organizer');
  document.getElementById('nav-profile').onclick = () => navigateTo('profile');
  
  // Form modal triggers
  document.getElementById('fab-btn').onclick = () => openAddModal();
  document.getElementById('btn-cancel-modal').onclick = closeModal;
  document.getElementById('form-activity-el').onsubmit = (e) => {
    e.preventDefault();
    saveFormActivity();
  };
  
  // Default load screen
  navigateTo('home');
  
  // Register Service Worker for offline capability
  if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('./sw.js')
      .then(() => console.log('[PWA] Service Worker registered successfully'))
      .catch(err => console.log('[PWA] Service Worker registration failed:', err));
  }
});
