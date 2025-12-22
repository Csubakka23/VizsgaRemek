// --- Egyszerű adatmodell localStorage-ban ---
const STORAGE_KEY = 'smartbook_demo_v1';

function readState() {
  const raw = localStorage.getItem(STORAGE_KEY);
  if (!raw) {
    const init = {
      users: [],        // {id,email,password,isAdmin}
      services: [],     // {id,name,duration}
      employees: [],    // {id,name,availabilityText}
      bookings: [],     // {id,userId,serviceId,employeeId,date,time,createdAt,status}
      notifications: []
    };
    localStorage.setItem(STORAGE_KEY, JSON.stringify(init));
    return init;
  }
  return JSON.parse(raw);
}

function writeState(s) {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(s));
}

// --- Segédfüggvények ---
function uid(prefix = 'id') {
  return prefix + '_' + Math.random().toString(36).slice(2, 9);
}

function todayISO() {
  return new Date().toISOString().slice(0, 10);
}

function formatDate(d) {
  return d; // egyszerűen így hagyjuk
}

function now() {
  return new Date().toISOString();
}

// --- Inicializálás demo-adatokkal ---
(function seed() {
  const s = readState();
  if (s.users.length === 0) {
    s.users.push({ id: uid('u'), email: 'admin@smartbook.hu', password: 'admin', isAdmin: true });
    s.users.push({ id: uid('u'), email: 'user@smartbook.hu', password: 'user', isAdmin: false });
    s.services.push({ id: uid('s'), name: 'Hajvágás (30 min)', duration: 30 });
    s.services.push({ id: uid('s'), name: 'Szőrtelenítés (45 min)', duration: 45 });
    s.employees.push({ id: uid('e'), name: 'Anna', availabilityText: 'H-P 09:00-17:00' });
    s.employees.push({ id: uid('e'), name: 'Béla', availabilityText: 'K-Cs 10:00-18:00' });
    writeState(s);
  }
})();
