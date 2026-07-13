/* ==========================================
   LifeFlow Core Application Logic
   ========================================== */

// 1. Localization Catalog (FR/EN)
const TRANSLATIONS = {
  FR: {
    welcome_title: "Bonjour, ",
    welcome_subtitle: "Aujourd'hui est un nouveau jour pour progresser.",
    progress_summary_title: "Progression Globale",
    progress_ratio: "{completed} sur {total} activités complétées",
    checklist_title: "Vos activités du jour",
    planning_view_title: "Planification",
    btn_add_activity_text: "Ajouter",
    stats_view_title: "Statistiques",
    stat_streak_title: "Série de jours",
    stat_total_title: "Total complétées",
    "stats-categories-title": "Completions par Catégorie",
    assistant_view_title: "Assistant IA",
    ai_status_active: "Gemini 1.5 Actif",
    ai_status_offline: "Mode Offline Actif",
    chat_placeholder: "Posez une question sur votre organisation...",
    profile_view_title: "Profil & Paramètres",
    settings_user_title: "Votre Pseudo",
    settings_theme_title: "Couleur de l'Application",
    settings_api_title: "Clé API Google Gemini",
    settings_api_desc: "Entrez votre clé API gratuite Gemini 1.5 Flash pour activer le coach d'organisation IA.",
    settings_danger_title: "Options d'application",
    test_notif_btn: "🔔 Tester Notification",
    reset_app_btn: "⚠️ Réinitialiser l'application",
    modal_add_title: "Nouvelle Activité",
    modal_edit_title: "Modifier l'Activité",
    lbl_act_name: "Nom de l'activité",
    lbl_act_emoji: "Emoji représentatif",
    lbl_act_cat: "Catégorie",
    lbl_act_time: "Heure de rappel",
    lbl_act_color: "Teinte de l'activité",
    lbl_act_recurrence: "Planification",
    lbl_act_days: "Jours d'exécution",
    lbl_act_date: "Date de planification",
    opt_health: "Santé & Bien-être",
    opt_work: "Travail & Études",
    opt_leisure: "Loisirs & Création",
    opt_household: "Maison & Quotidien",
    btn_save: "Enregistrer",
    btn_delete: "Supprimer",
    confirm_reset: "Voulez-vous vraiment réinitialiser toutes vos données ? Cette action est irréversible.",
    empty_today: "Aucune activité planifiée pour aujourd'hui. Profitez-en pour vous détendre !",
    empty_date: "Aucune activité pour cette date.",
    notif_granted: "Notifications autorisées !",
    notif_denied: "Autorisation de notification refusée.",
    ai_fallback_welcome: "Bonjour ! Je suis votre coach d'organisation LifeFlow. Configurez votre clé API Gemini dans l'onglet Profil pour des conseils ultra-personnalisés, ou discutez avec moi hors-ligne !",
    ai_msg_hello: "Bonjour ! Comment se passe votre journée d'organisation ?",
    ai_msg_sport: "Le sport est la clé de la discipline. Même 10 minutes font une différence !",
    ai_msg_default: "Excellent ! Continuez à valider vos tâches pour rester au top de votre forme. Posez-moi des questions spécifiques ou ajoutez votre clé API pour en savoir plus !"
  },
  EN: {
    welcome_title: "Hello, ",
    welcome_subtitle: "Today is a new day to make progress.",
    progress_summary_title: "Global Progress",
    progress_ratio: "{completed} of {total} activities completed",
    checklist_title: "Today's activities",
    planning_view_title: "Planning",
    btn_add_activity_text: "Add New",
    stats_view_title: "Statistics",
    stat_streak_title: "Day streak",
    stat_total_title: "Total completed",
    "stats-categories-title": "Completions by Category",
    assistant_view_title: "AI Assistant",
    ai_status_active: "Gemini 1.5 Active",
    ai_status_offline: "Offline Mode Active",
    chat_placeholder: "Ask a question about your productivity...",
    profile_view_title: "Profile & Settings",
    settings_user_title: "Your Username",
    settings_theme_title: "Application Color",
    settings_api_title: "Google Gemini API Key",
    settings_api_desc: "Enter your free Gemini 1.5 Flash API key to enable the AI coach planner.",
    settings_danger_title: "App Options",
    test_notif_btn: "🔔 Test Notification",
    reset_app_btn: "⚠️ Reset application",
    modal_add_title: "New Activity",
    modal_edit_title: "Edit Activity",
    lbl_act_name: "Activity name",
    lbl_act_emoji: "Representative Emoji",
    lbl_act_cat: "Category",
    lbl_act_time: "Reminder time",
    lbl_act_color: "Activity color",
    lbl_act_recurrence: "Scheduling",
    lbl_act_days: "Days of execution",
    lbl_act_date: "Planning date",
    opt_health: "Health & Well-being",
    opt_work: "Work & Studies",
    opt_leisure: "Leisure & Creation",
    opt_household: "Home & Daily",
    btn_save: "Save Changes",
    btn_delete: "Delete",
    confirm_reset: "Are you sure you want to reset all your data? This action cannot be undone.",
    empty_today: "No activities planned for today. Take some time to relax!",
    empty_date: "No activities for this date.",
    notif_granted: "Notifications allowed!",
    notif_denied: "Notification permission denied.",
    ai_fallback_welcome: "Hello! I am your LifeFlow organization coach. Add your Gemini API key in the Profile tab for smart custom advice, or talk to me offline!",
    ai_msg_hello: "Hello! How is your day going?",
    ai_msg_sport: "Exercise is the key to discipline. Even 10 minutes makes a difference!",
    ai_msg_default: "Great! Keep checking off your activities to stay in top shape. Ask me specific questions or add your API key for advanced coaching!"
  }
};

// 2. Application State & Storage Defaults
let appState = {
  settings: {
    lang: 'FR',
    username: 'Driss',
    themeColor: '#8a2be2',
    geminiKey: ''
  },
  templates: [
    // Pre-populate with standard sample templates
    { id: '1', name: 'Méditation', emoji: '🧘', category: 'Health', time: '08:00', color: '#00ff88', recurType: 'weekly', days: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'], date: '' },
    { id: '2', name: 'Lecture', emoji: '📚', category: 'Leisure', time: '21:00', color: '#ff007c', recurType: 'weekly', days: ['Mon', 'Wed', 'Fri'], date: '' },
    { id: '3', name: 'Planification', emoji: '🦋', category: 'Work', time: '09:00', color: '#00e1ff', recurType: 'weekly', days: ['Mon', 'Sun'], date: '' }
  ],
  logs: [],
  messages: []
};

// Load state from localStorage
function loadState() {
  const savedSettings = localStorage.getItem('lifeflow_settings');
  const savedTemplates = localStorage.getItem('lifeflow_templates');
  const savedLogs = localStorage.getItem('lifeflow_logs');
  const savedMessages = localStorage.getItem('lifeflow_messages');

  if (savedSettings) appState.settings = JSON.parse(savedSettings);
  if (savedTemplates) appState.templates = JSON.parse(savedTemplates);
  if (savedLogs) appState.logs = JSON.parse(savedLogs);
  if (savedMessages) appState.messages = JSON.parse(savedMessages);
}

function saveState() {
  localStorage.setItem('lifeflow_settings', JSON.stringify(appState.settings));
  localStorage.setItem('lifeflow_templates', JSON.stringify(appState.templates));
  localStorage.setItem('lifeflow_logs', JSON.stringify(appState.logs));
  localStorage.setItem('lifeflow_messages', JSON.stringify(appState.messages));
}

// 3. UI Helpers & View Navigation
function initNavigation() {
  const navItems = document.querySelectorAll('.nav-item');
  const views = document.querySelectorAll('.app-view');

  navItems.forEach(item => {
    item.addEventListener('click', () => {
      const targetView = item.getAttribute('data-view');
      
      navItems.forEach(n => n.classList.remove('active'));
      views.forEach(v => v.classList.remove('active'));

      item.classList.add('active');
      const viewElement = document.getElementById(`view-${targetView}`);
      if (viewElement) {
        viewElement.classList.add('active');
        // Render view specific components on enter
        if (targetView === 'planning') renderCalendar();
        if (targetView === 'progress') renderStats();
        if (targetView === 'home') renderTodayList();
      }
    });
  });
}

// Set app theme dynamically
function applyThemeColor(color) {
  appState.settings.themeColor = color;
  document.documentElement.style.setProperty('--neon-color', color);
  // Compute overlay glow
  const r = parseInt(color.slice(1, 3), 16);
  const g = parseInt(color.slice(3, 5), 16);
  const b = parseInt(color.slice(5, 7), 16);
  document.documentElement.style.setProperty('--neon-glow', `rgba(${r}, ${g}, ${b}, 0.35)`);
  document.documentElement.style.setProperty('--card-glow', `rgba(${r}, ${g}, ${b}, 0.12)`);
  
  // Highlight active theme picker button
  document.querySelectorAll('.theme-color-option').forEach(opt => {
    if (opt.getAttribute('data-color') === color) {
      opt.classList.add('active');
    } else {
      opt.classList.remove('active');
    }
  });
  
  // Sync HTML5 custom picker
  document.getElementById('global-accent-picker').value = color;
  
  saveState();
}

// 4. Dynamic Localization Engine
function applyLocalization() {
  const lang = appState.settings.lang;
  const dict = TRANSLATIONS[lang];
  
  // Update toggle button text
  document.getElementById('lang-toggle-btn').querySelector('.btn-text').innerText = lang === 'FR' ? 'EN' : 'FR';
  
  // Localize plain elements by ID
  Object.keys(dict).forEach(key => {
    const el = document.getElementById(key);
    if (el) {
      if (el.tagName === 'INPUT' || el.tagName === 'TEXTAREA') {
        el.placeholder = dict[key];
      } else {
        el.innerText = dict[key];
      }
    }
  });

  // Localize text in specific elements
  document.getElementById('welcome-title').innerText = `${dict.welcome_title}${appState.settings.username}`;
  document.getElementById('chat-input').placeholder = dict.chat_placeholder;

  // Localize forms and tabs specifically
  document.getElementById('tab-home').innerText = lang === 'FR' ? 'Aujourd\'hui' : 'Today';
  document.getElementById('tab-planning').innerText = lang === 'FR' ? 'Calendrier' : 'Calendar';
  document.getElementById('tab-progress').innerText = lang === 'FR' ? 'Stats' : 'Stats';
  document.getElementById('tab-assistant').innerText = lang === 'FR' ? 'Coach IA' : 'AI Coach';
  document.getElementById('tab-profile').innerText = lang === 'FR' ? 'Profil' : 'Profile';
  
  // Sync AI Status
  updateAIStatusText();

  // Refresh lists
  renderTodayList();
  renderCalendar();
  renderStats();
}

function updateAIStatusText() {
  const lang = appState.settings.lang;
  const dict = TRANSLATIONS[lang];
  const hasKey = !!appState.settings.geminiKey;
  const statusDot = document.querySelector('.status-dot');
  
  if (hasKey) {
    document.getElementById('ai-status-text').innerText = dict.ai_status_active;
    statusDot.style.background = '#00ff88';
    statusDot.style.boxShadow = '0 0 8px #00ff88';
  } else {
    document.getElementById('ai-status-text').innerText = dict.ai_status_offline;
    statusDot.style.background = '#ff007c';
    statusDot.style.boxShadow = '0 0 8px #ff007c';
  }
}

// 5. Calendar Engine
let calendarCurrentDate = new Date();
let calendarSelectedDate = new Date();

const weekdayKeys = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

function getFormattedDateKey(date) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}

function getActivitiesForDate(date) {
  const dayName = weekdayKeys[date.getDay()];
  const dateKey = getFormattedDateKey(date);
  
  return appState.templates.filter(t => {
    if (t.recurType === 'weekly') {
      return t.days.includes(dayName);
    } else {
      return t.date === dateKey;
    }
  });
}

function renderCalendar() {
  const grid = document.getElementById('calendar-days-grid');
  const monthYearLabel = document.getElementById('calendar-month-year');
  grid.innerHTML = '';

  const year = calendarCurrentDate.getFullYear();
  const month = calendarCurrentDate.getMonth();

  // Set month label
  const monthNames = appState.settings.lang === 'FR' 
    ? ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"]
    : ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  monthYearLabel.innerText = `${monthNames[month]} ${year}`;

  // Find start day of month (Monday-indexed)
  let firstDayIndex = new Date(year, month, 1).getDay();
  // Adjust so Monday is 0, Sunday is 6
  firstDayIndex = firstDayIndex === 0 ? 6 : firstDayIndex - 1;

  const totalDays = new Date(year, month + 1, 0).getDate();
  const prevMonthTotalDays = new Date(year, month, 0).getDate();

  // Render previous month cells (inactive)
  for (let i = firstDayIndex - 1; i >= 0; i--) {
    const dayNum = prevMonthTotalDays - i;
    const cell = createCalendarCell(dayNum, new Date(year, month - 1, dayNum), true);
    grid.appendChild(cell);
  }

  // Render current month cells
  const todayKey = getFormattedDateKey(new Date());
  const selectedKey = getFormattedDateKey(calendarSelectedDate);
  
  for (let dayNum = 1; dayNum <= totalDays; dayNum++) {
    const cellDate = new Date(year, month, dayNum);
    const cellKey = getFormattedDateKey(cellDate);
    
    const cell = createCalendarCell(dayNum, cellDate, false);
    
    if (cellKey === todayKey) cell.classList.add('today');
    if (cellKey === selectedKey) cell.classList.add('selected');
    
    grid.appendChild(cell);
  }

  // Render next month cells (inactive)
  const remainingCells = 42 - (firstDayIndex + totalDays);
  for (let i = 1; i <= remainingCells; i++) {
    const cell = createCalendarCell(i, new Date(year, month + 1, i), true);
    grid.appendChild(cell);
  }

  // Render activities list for selected date
  renderSelectedDateActivities();
}

function createCalendarCell(dayNum, date, isInactive) {
  const cell = document.createElement('div');
  cell.className = 'calendar-day-cell';
  if (isInactive) cell.classList.add('inactive');
  
  cell.innerHTML = `<span>${dayNum}</span>`;
  
  // Append activity dots
  const dayActivities = getActivitiesForDate(date);
  if (dayActivities.length > 0) {
    const dotsContainer = document.createElement('div');
    dotsContainer.className = 'calendar-day-dots';
    
    // Limit to maximum 3 dots to prevent overlap
    dayActivities.slice(0, 3).forEach(act => {
      const dot = document.createElement('span');
      dot.className = 'cal-dot';
      dot.style.background = act.color;
      dotsContainer.appendChild(dot);
    });
    cell.appendChild(dotsContainer);
  }

  // Click handler
  cell.addEventListener('click', () => {
    calendarSelectedDate = date;
    calendarCurrentDate = new Date(date); // Sync view
    renderCalendar();
  });

  return cell;
}

function renderSelectedDateActivities() {
  const container = document.getElementById('selected-activities-list');
  const title = document.getElementById('selected-date-title');
  container.innerHTML = '';

  const date = calendarSelectedDate;
  const lang = appState.settings.lang;
  const dict = TRANSLATIONS[lang];
  
  // Format title date
  const options = { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' };
  const formattedDate = date.toLocaleDateString(lang === 'FR' ? 'fr-FR' : 'en-US', options);
  title.innerText = lang === 'FR' ? `Activités pour le ${formattedDate}` : `Activities for ${formattedDate}`;

  const dayActivities = getActivitiesForDate(date);
  if (dayActivities.length === 0) {
    container.innerHTML = `<div class="empty-state"><p>${dict.empty_date}</p></div>`;
    return;
  }

  const dateKey = getFormattedDateKey(date);

  dayActivities.forEach(act => {
    const isCompleted = appState.logs.some(l => l.templateId === act.id && l.dateKey === dateKey && l.status === 'completed');
    
    const item = document.createElement('div');
    item.className = `activity-item ${isCompleted ? 'completed' : ''}`;
    item.style.borderColor = isCompleted ? act.color : 'var(--card-border)';
    
    item.innerHTML = `
      <div class="activity-info-block">
        <div class="activity-emoji-box" style="background: ${act.color}15; border-color: ${act.color}30;">
          ${act.emoji}
        </div>
        <div class="activity-text">
          <h4>${act.name}</h4>
          <span>
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            ${act.time}
          </span>
        </div>
      </div>
      <button class="header-btn" style="background: rgba(255,255,255,0.03); border-color: var(--card-border);">${lang === 'FR' ? 'Modifier' : 'Edit'}</button>
    `;

    // Click on item opens Edit Modal
    item.addEventListener('click', (e) => {
      // Prevent modal opening when clicking action button if we implement it, but here the whole row triggers it
      openActivityModal(act);
    });

    container.appendChild(item);
  });
}

// 6. Today Checklist & Progress Ring Renderers
function renderTodayList() {
  const container = document.getElementById('today-activities-list');
  container.innerHTML = '';
  
  const today = new Date();
  const dateKey = getFormattedDateKey(today);
  const todayActivities = getActivitiesForDate(today);
  const dict = TRANSLATIONS[appState.settings.lang];

  if (todayActivities.length === 0) {
    container.innerHTML = `<div class="empty-state"><div class="empty-state-emoji">🦋</div><p>${dict.empty_today}</p></div>`;
    updateProgressRing(0, 0);
    return;
  }

  let completedCount = 0;

  todayActivities.forEach(act => {
    const isCompleted = appState.logs.some(l => l.templateId === act.id && l.dateKey === dateKey && l.status === 'completed');
    if (isCompleted) completedCount++;

    const item = document.createElement('div');
    item.className = `activity-item ${isCompleted ? 'completed' : ''}`;
    if (isCompleted) {
      item.style.borderColor = act.color;
      item.style.boxShadow = `0 4px 15px ${act.color}15`;
    }
    
    item.innerHTML = `
      <div class="activity-info-block">
        <div class="activity-emoji-box" style="background: ${act.color}15; border-color: ${act.color}30;">
          ${act.emoji}
        </div>
        <div class="activity-text">
          <h4>${act.name}</h4>
          <span>
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            ${act.time}
          </span>
        </div>
      </div>
      <div class="activity-checkbox" style="border-color: ${isCompleted ? act.color : 'rgba(255,255,255,0.2)'}; background-color: ${isCompleted ? act.color : 'transparent'};">
        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
      </div>
    `;

    // Toggle completion on click
    item.addEventListener('click', (e) => {
      toggleActivityCompletion(act.id, dateKey);
    });

    container.appendChild(item);
  });

  updateProgressRing(completedCount, todayActivities.length);
}

function toggleActivityCompletion(templateId, dateKey) {
  const logIndex = appState.logs.findIndex(l => l.templateId === templateId && l.dateKey === dateKey);
  
  if (logIndex > -1) {
    // Revert completion
    appState.logs.splice(logIndex, 1);
  } else {
    // Add completion log
    appState.logs.push({
      id: Math.random().toString(36).substr(2, 9),
      templateId: templateId,
      dateKey: dateKey,
      date: new Date().toISOString(),
      status: 'completed'
    });
    // Trigger confetti satisfaction effect!
    triggerConfetti();
  }
  
  saveState();
  renderTodayList();
}

function updateProgressRing(completed, total) {
  const percentSpan = document.getElementById('progress-percent');
  const ratioP = document.getElementById('progress-ratio');
  const circle = document.getElementById('today-progress-bar');
  const dict = TRANSLATIONS[appState.settings.lang];

  if (total === 0) {
    percentSpan.innerText = '0%';
    ratioP.innerText = dict.progress_ratio.replace('{completed}', 0).replace('{total}', 0);
    circle.style.strokeDashoffset = 314.16;
    return;
  }

  const percent = Math.round((completed / total) * 100);
  percentSpan.innerText = `${percent}%`;
  
  // Format subtitle ratio
  ratioP.innerText = dict.progress_ratio.replace('{completed}', completed).replace('{total}', total);
  
  // Update dynamic SVG offset
  const circumference = 2 * Math.PI * 50; // r=50 -> 314.16
  const offset = circumference - (percent / 100) * circumference;
  circle.style.strokeDashoffset = offset;
}

// 7. Confetti Satisfaction Effect
let confettiParticles = [];
function triggerConfetti() {
  const canvas = document.getElementById('confetti-canvas');
  const ctx = canvas.getContext('2d');
  
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  
  confettiParticles = [];
  const colors = ['#8a2be2', '#00ffcc', '#ff007f', '#39ff14', '#00bfff', '#ffd700'];
  
  for (let i = 0; i < 80; i++) {
    confettiParticles.push({
      x: canvas.width / 2,
      y: canvas.height * 0.7, // Spark from near validation list
      color: colors[Math.floor(Math.random() * colors.length)],
      size: Math.random() * 6 + 4,
      speedX: (Math.random() - 0.5) * 12,
      speedY: -(Math.random() * 8 + 8),
      gravity: 0.35,
      rotation: Math.random() * 360,
      rotationSpeed: (Math.random() - 0.5) * 10,
      opacity: 1
    });
  }
  
  requestAnimationFrame(updateConfetti);
}

function updateConfetti() {
  const canvas = document.getElementById('confetti-canvas');
  const ctx = canvas.getContext('2d');
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  
  let active = false;
  
  confettiParticles.forEach(p => {
    if (p.opacity > 0) {
      active = true;
      p.x += p.speedX;
      p.y += p.speedY;
      p.speedY += p.gravity;
      p.rotation += p.rotationSpeed;
      p.opacity -= 0.015;
      
      ctx.save();
      ctx.translate(p.x, p.y);
      ctx.rotate((p.rotation * Math.PI) / 180);
      ctx.globalAlpha = p.opacity;
      ctx.fillStyle = p.color;
      ctx.fillRect(-p.size / 2, -p.size / 2, p.size, p.size);
      ctx.restore();
    }
  });
  
  if (active) {
    requestAnimationFrame(updateConfetti);
  }
}

// 8. Progress & Stats Tracker Tab
function renderStats() {
  const streakVal = document.getElementById('stat-streak-val');
  const totalVal = document.getElementById('stat-total-val');
  const chartContainer = document.getElementById('categories-chart-container');
  
  // Total completed tasks count
  totalVal.innerText = appState.logs.length;
  
  // Calculate day streak
  streakVal.innerText = calculateStreak();
  
  // Render completions by category
  chartContainer.innerHTML = '';
  
  const categories = [
    { key: 'Health', name: TRANSLATIONS[appState.settings.lang].opt_health, color: 'var(--color-health)' },
    { key: 'Work', name: TRANSLATIONS[appState.settings.lang].opt_work, color: 'var(--color-work)' },
    { key: 'Leisure', name: TRANSLATIONS[appState.settings.lang].opt_leisure, color: 'var(--color-leisure)' },
    { key: 'Household', name: TRANSLATIONS[appState.settings.lang].opt_household, color: 'var(--color-household)' }
  ];

  // Get total templates count by category
  categories.forEach(cat => {
    const templates = appState.templates.filter(t => t.category === cat.key);
    // Count completions log matching these template IDs
    const completions = appState.logs.filter(l => templates.some(t => t.id === l.templateId)).length;
    
    // Find maximum completions to scale bars relatively
    const maxVal = Math.max(1, ...categories.map(c => {
      const ts = appState.templates.filter(t => t.category === c.key);
      return appState.logs.filter(l => ts.some(t => t.id === l.templateId)).length;
    }));
    
    const percentage = Math.round((completions / maxVal) * 100);
    
    const barRow = document.createElement('div');
    barRow.className = 'chart-bar-row';
    barRow.innerHTML = `
      <div class="chart-bar-info">
        <span>${cat.name}</span>
        <span>${completions}</span>
      </div>
      <div class="chart-bar-bg">
        <div class="chart-bar-fill" style="width: ${percentage}%; background-color: ${cat.color};"></div>
      </div>
    `;
    chartContainer.appendChild(barRow);
  });
}

function calculateStreak() {
  const dates = appState.logs.map(l => l.dateKey);
  if (dates.length === 0) return 0;
  
  // Deduplicate and sort dates descending
  const uniqueDates = [...new Set(dates)].sort().reverse();
  
  let streak = 0;
  let expectedDate = new Date();
  
  // If the last completion was yesterday, or today, keep check
  const todayKey = getFormattedDateKey(expectedDate);
  expectedDate.setDate(expectedDate.getDate() - 1);
  const yesterdayKey = getFormattedDateKey(expectedDate);
  
  if (!uniqueDates.includes(todayKey) && !uniqueDates.includes(yesterdayKey)) {
    return 0;
  }
  
  // Re-initialize for validation traversal
  let checkDate = new Date();
  if (!uniqueDates.includes(getFormattedDateKey(checkDate))) {
    checkDate.setDate(checkDate.getDate() - 1);
  }
  
  while (true) {
    const checkKey = getFormattedDateKey(checkDate);
    if (uniqueDates.includes(checkKey)) {
      streak++;
      checkDate.setDate(checkDate.getDate() - 1); // Go back one day
    } else {
      break;
    }
  }
  
  return streak;
}

// 9. Add/Edit Activity Modal
function initActivityForm() {
  const modal = document.getElementById('activity-modal');
  const form = document.getElementById('activity-form');
  const addBtn = document.getElementById('add-activity-btn');
  const closeBtn = document.getElementById('close-modal-btn');
  
  const weeklySelector = document.getElementById('recurrence-type-weekly');
  const onceSelector = document.getElementById('recurrence-type-once');
  const weeklyDaysSec = document.getElementById('weekly-days-section');
  const onceDateSec = document.getElementById('unique-date-section');
  
  const quickEmojis = document.querySelectorAll('#emoji-quick-select span');
  const emojiInput = document.getElementById('activity-emoji-input');
  
  const deleteBtn = document.getElementById('delete-activity-form-btn');
  
  // Form type toggles
  weeklySelector.addEventListener('click', () => {
    weeklySelector.classList.add('active');
    onceSelector.classList.remove('active');
    weeklyDaysSec.classList.add('active-recur-section');
    onceDateSec.classList.remove('active-recur-section');
  });
  
  onceSelector.addEventListener('click', () => {
    onceSelector.classList.add('active');
    weeklySelector.classList.remove('active');
    onceDateSec.classList.add('active-recur-section');
    weeklyDaysSec.classList.remove('active-recur-section');
    // Default today's date if empty
    const dateInput = document.getElementById('activity-date-input');
    if (!dateInput.value) dateInput.value = getFormattedDateKey(new Date());
  });

  // Weekday buttons toggle active
  const weekdayButtons = document.querySelectorAll('.day-checkbox');
  weekdayButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      btn.classList.toggle('active');
    });
  });

  // Quick Emoji clicker
  quickEmojis.forEach(span => {
    span.addEventListener('click', () => {
      emojiInput.value = span.innerText;
    });
  });

  // Modal show/hide
  addBtn.addEventListener('click', () => {
    openActivityModal(null);
  });
  
  closeBtn.addEventListener('click', () => {
    modal.classList.remove('active');
  });
  
  // Form submit
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    saveActivity();
  });
  
  // Delete handler
  deleteBtn.addEventListener('click', () => {
    const id = document.getElementById('edit-activity-id').value;
    deleteActivity(id);
  });
}

function openActivityModal(activity = null) {
  const modal = document.getElementById('activity-modal');
  const form = document.getElementById('activity-form');
  const modalTitle = document.getElementById('modal-activity-title');
  const deleteBtn = document.getElementById('delete-activity-form-btn');
  const dict = TRANSLATIONS[appState.settings.lang];
  
  // Reset form
  form.reset();
  document.querySelectorAll('.day-checkbox').forEach(btn => btn.classList.remove('active'));
  
  if (activity) {
    // Edit Mode
    modalTitle.innerText = dict.modal_edit_title;
    deleteBtn.classList.remove('hide');
    
    document.getElementById('edit-activity-id').value = activity.id;
    document.getElementById('activity-name-input').value = activity.name;
    document.getElementById('activity-emoji-input').value = activity.emoji;
    document.getElementById('activity-category-select').value = activity.category;
    document.getElementById('activity-time-input').value = activity.time;
    document.getElementById('activity-color-input').value = activity.color;
    
    if (activity.recurType === 'weekly') {
      document.getElementById('recurrence-type-weekly').click();
      activity.days.forEach(d => {
        const btn = document.querySelector(`.day-checkbox[data-day="${d}"]`);
        if (btn) btn.classList.add('active');
      });
    } else {
      document.getElementById('recurrence-type-once').click();
      document.getElementById('activity-date-input').value = activity.date;
    }
  } else {
    // Add Mode
    modalTitle.innerText = dict.modal_add_title;
    deleteBtn.classList.add('hide');
    document.getElementById('edit-activity-id').value = '';
    
    // Default form configuration
    document.getElementById('recurrence-type-weekly').click();
    document.querySelectorAll('.day-checkbox').forEach(btn => btn.classList.add('active'));
    document.getElementById('activity-emoji-input').value = '💪';
    document.getElementById('activity-color-input').value = appState.settings.themeColor;
  }
  
  modal.classList.add('active');
}

function saveActivity() {
  const id = document.getElementById('edit-activity-id').value;
  const name = document.getElementById('activity-name-input').value;
  const emoji = document.getElementById('activity-emoji-input').value;
  const category = document.getElementById('activity-category-select').value;
  const time = document.getElementById('activity-time-input').value;
  const color = document.getElementById('activity-color-input').value;
  
  const isWeekly = document.getElementById('recurrence-type-weekly').classList.contains('active');
  const recurType = isWeekly ? 'weekly' : 'once';
  
  let days = [];
  let date = '';
  
  if (isWeekly) {
    document.querySelectorAll('.day-checkbox.active').forEach(btn => {
      days.push(btn.getAttribute('data-day'));
    });
  } else {
    date = document.getElementById('activity-date-input').value;
  }
  
  if (id) {
    // Update existing
    const index = appState.templates.findIndex(t => t.id === id);
    if (index > -1) {
      appState.templates[index] = { id, name, emoji, category, time, color, recurType, days, date };
    }
  } else {
    // Add new
    const newId = Math.random().toString(36).substr(2, 9);
    appState.templates.push({ id: newId, name, emoji, category, time, color, recurType, days, date });
  }
  
  saveState();
  document.getElementById('activity-modal').classList.remove('active');
  
  // Refresh views
  renderTodayList();
  renderCalendar();
}

function deleteActivity(id) {
  appState.templates = appState.templates.filter(t => t.id !== id);
  // Also delete completions log for this template to clean up
  appState.logs = appState.logs.filter(l => l.templateId !== id);
  
  saveState();
  document.getElementById('activity-modal').classList.remove('active');
  
  // Refresh views
  renderTodayList();
  renderCalendar();
}

// 10. AI Coach Chat & Gemini 1.5 Flash Client Integration
function initChatCoach() {
  const sendBtn = document.getElementById('send-chat-btn');
  const chatInput = document.getElementById('chat-input');
  
  // Show welcome chat prompt if no messages yet
  if (appState.messages.length === 0) {
    const welcomeText = TRANSLATIONS[appState.settings.lang].ai_fallback_welcome;
    appState.messages.push({
      id: 'welcome',
      sender: 'ai',
      text: welcomeText,
      timestamp: new Date().toISOString()
    });
    saveState();
  }
  
  renderChatMessages();

  sendBtn.addEventListener('click', sendUserMessage);
  chatInput.addEventListener('keydown', (e) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      sendUserMessage();
    }
  });
}

function renderChatMessages() {
  const container = document.getElementById('chat-messages-container');
  container.innerHTML = '';
  
  appState.messages.forEach(msg => {
    const el = document.createElement('div');
    el.className = `chat-message ${msg.sender}`;
    el.innerText = msg.text;
    container.appendChild(el);
  });
  
  // Auto scroll to bottom
  container.scrollTop = container.scrollHeight;
}

async function sendUserMessage() {
  const input = document.getElementById('chat-input');
  const text = input.value.trim();
  if (!text) return;
  
  // Clear input
  input.value = '';
  
  // Add user message
  appState.messages.push({
    id: Math.random().toString(36).substr(2, 9),
    sender: 'user',
    text: text,
    timestamp: new Date().toISOString()
  });
  renderChatMessages();
  saveState();

  // Show typing or loading indicator (represented by dot glow in CSS or simple placeholder)
  const typingMsg = {
    id: 'typing',
    sender: 'ai',
    text: '...'
  };
  appState.messages.push(typingMsg);
  renderChatMessages();

  const aiReply = await queryAICoach(text);
  
  // Remove typing indicator and add reply
  appState.messages = appState.messages.filter(m => m.id !== 'typing');
  appState.messages.push({
    id: Math.random().toString(36).substr(2, 9),
    sender: 'ai',
    text: aiReply,
    timestamp: new Date().toISOString()
  });
  renderChatMessages();
  saveState();
}

async function queryAICoach(userPrompt) {
  const key = appState.settings.geminiKey;
  const lang = appState.settings.lang;
  const username = appState.settings.username;
  const dict = TRANSLATIONS[lang];
  
  // Context detailing all currently scheduled activities to the AI
  const scheduledNames = appState.templates.map(t => `${t.emoji} ${t.name} (${t.time})`).join(', ');
  const systemPrompt = `You are a supportive, high-energy bilingual productivity and lifestyle organizer coach named LifeFlow.
    The current user is ${username}. 
    They have the following activities planned in their routine: [${scheduledNames}].
    Reply in ${lang === 'FR' ? 'French' : 'English'} only. Keep your response concise (maximum 3-4 sentences), encouraging, and actionable.`;

  if (!key) {
    // Offline Rule fallback
    return new Promise((resolve) => {
      setTimeout(() => {
        const query = userPrompt.toLowerCase();
        if (query.includes('bonjour') || query.includes('hello') || query.includes('salut')) {
          resolve(dict.ai_msg_hello);
        } else if (query.includes('sport') || query.includes('physique') || query.includes('muscu') || query.includes('run')) {
          resolve(dict.ai_msg_sport);
        } else {
          resolve(dict.ai_msg_default);
        }
      }, 1000);
    });
  }

  // online Gemini API call
  const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${key}`;
  
  // Format simple prompt appending rules
  const body = {
    contents: [
      {
        role: "user",
        parts: [{ text: `${systemPrompt}\n\nUser asks: "${userPrompt}"` }]
      }
    ]
  };

  try {
    const res = await fetch(url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    });
    
    if (!res.ok) {
      throw new Error(`API returned status ${res.status}`);
    }
    
    const data = await res.json();
    const replyText = data.candidates[0].content.parts[0].text.trim();
    return replyText;
  } catch (error) {
    console.error("Gemini API call failed, loading offline fallback:", error);
    return `${dict.ai_fallback_welcome} (API Error: ${error.message})`;
  }
}

// 11. Profile & Settings Tab Controllers
function initProfileTab() {
  const langToggle = document.getElementById('lang-toggle-btn');
  const saveNameBtn = document.getElementById('save-username-btn');
  const nameInput = document.getElementById('username-input');
  
  const saveKeyBtn = document.getElementById('save-key-btn');
  const keyInput = document.getElementById('gemini-key-input');
  
  const testNotifBtn = document.getElementById('test-notif-btn');
  const resetBtn = document.getElementById('reset-app-btn');
  
  // Set initial settings inputs values
  nameInput.value = appState.settings.username;
  keyInput.value = appState.settings.geminiKey;

  // Lang toggle
  langToggle.addEventListener('click', () => {
    appState.settings.lang = appState.settings.lang === 'FR' ? 'EN' : 'FR';
    saveState();
    applyLocalization();
  });

  // Save name
  saveNameBtn.addEventListener('click', () => {
    const val = nameInput.value.trim();
    if (val) {
      appState.settings.username = val;
      saveState();
      applyLocalization();
      
      // Visual validation micro-animation feedback
      saveNameBtn.innerText = '✓';
      setTimeout(() => saveNameBtn.innerText = 'OK', 1500);
    }
  });

  // Save Key
  saveKeyBtn.addEventListener('click', () => {
    const val = keyInput.value.trim();
    appState.settings.geminiKey = val;
    saveState();
    updateAIStatusText();
    
    saveKeyBtn.innerText = '✓';
    setTimeout(() => saveKeyBtn.innerText = 'OK', 1500);
  });

  // Color selection list
  document.querySelectorAll('.theme-color-option').forEach(btn => {
    btn.addEventListener('click', () => {
      applyThemeColor(btn.getAttribute('data-color'));
    });
  });

  // HTML5 color picker sync
  document.getElementById('global-accent-picker').addEventListener('input', (e) => {
    applyThemeColor(e.target.value);
  });

  // Notification Test trigger
  testNotifBtn.addEventListener('click', requestAndTriggerNotification);

  // App Reset
  resetBtn.addEventListener('click', () => {
    const dict = TRANSLATIONS[appState.settings.lang];
    if (confirm(dict.confirm_reset)) {
      localStorage.clear();
      location.reload();
    }
  });
}

// 12. Local Web Notification Manager
function requestAndTriggerNotification() {
  const dict = TRANSLATIONS[appState.settings.lang];
  
  if (!('Notification' in window)) {
    alert("Votre navigateur ne supporte pas les notifications.");
    return;
  }

  Notification.requestPermission().then(permission => {
    if (permission === 'granted') {
      // Trigger instant sample notification
      const option = {
        body: appState.settings.lang === 'FR' 
          ? "LifeFlow : Reste discipliné et valide tes objectifs !"
          : "LifeFlow: Stay disciplined and reach your goals!",
        icon: 'icons/icon-192.png',
        badge: 'icons/icon-192.png',
        vibrate: [200, 100, 200]
      };
      new Notification("LifeFlow 🦋", option);
      alert(dict.notif_granted);
    } else {
      alert(dict.notif_denied);
    }
  });
}

// 13. Application Boot Loader
window.addEventListener('DOMContentLoaded', () => {
  loadState();
  initNavigation();
  initActivityForm();
  initChatCoach();
  initProfileTab();
  
  // Boot settings
  applyThemeColor(appState.settings.themeColor);
  applyLocalization();
});
