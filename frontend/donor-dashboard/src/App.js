import React, { useState, useEffect } from 'react';

function App() {
  const [donors, setDonors] = useState([]);
  const [recipientType, setRecipientType] = useState('O-');
  const [searchCity, setSearchCity] = useState('');

  const fetchMatches = async (type, city) => {
 // Change this line in your fetchMatches function:
const url = `http://127.0.0.1:55469/api.cfm?bloodType=${encodeURIComponent(type)}&city=${encodeURIComponent(city)}`;
    
    try {
      const response = await fetch(url);
      const data = await response.json();
      // Sort so highest scores appear first
      const sortedData = data.sort((a, b) => b.matchScore - a.matchScore);
      setDonors(sortedData);
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  useEffect(() => {
    fetchMatches(recipientType, searchCity);
  }, [recipientType, searchCity]);

  return (
    <div style={{ backgroundColor: '#f4f7f9', minHeight: '100vh', padding: '40px', fontFamily: '"Segoe UI", Tahoma, Geneva, Verdana, sans-serif' }}>
      <div style={{ maxWidth: '800px', margin: '0 auto' }}>
        
        <header style={{ textAlign: 'center', marginBottom: '40px' }}>
          <h1 style={{ color: '#2c3e50', fontSize: '2.5rem', marginBottom: '10px' }}>🏥 Florida Medical Match</h1>
          <p style={{ color: '#7f8c8d' }}>Real-time Donor Compatibility System</p>
        </header>

        <div style={{ display: 'flex', gap: '20px', backgroundColor: 'white', padding: '25px', borderRadius: '12px', boxShadow: '0 4px 6px rgba(0,0,0,0.1)', marginBottom: '30px' }}>
          <div style={{ flex: 1 }}>
            <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '8px' }}>Recipient Blood Type</label>
            <select 
              style={{ width: '100%', padding: '10px', borderRadius: '6px', border: '1px solid #ddd' }}
              value={recipientType} 
              onChange={(e) => setRecipientType(e.target.value)}
            >
              {['O-', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+'].map(t => <option key={t} value={t}>{t}</option>)}
            </select>
          </div>

          <div style={{ flex: 1 }}>
            <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '8px' }}>Filter by City (Bonus)</label>
            <input 
              style={{ width: '95%', padding: '10px', borderRadius: '6px', border: '1px solid #ddd' }}
              type="text" 
              placeholder="e.g. Boston" 
              value={searchCity}
              onChange={(e) => setSearchCity(e.target.value)}
            />
          </div>
        </div>

        <div style={{ display: 'grid', gap: '20px' }}>
          {donors.map(donor => (
            <div key={donor.id} style={{
              backgroundColor: 'white',
              padding: '20px',
              borderRadius: '10px',
              borderLeft: donor.matchScore >= 100 ? '8px solid #2ecc71' : '8px solid #bdc3c7',
              boxShadow: '0 2px 4px rgba(0,0,0,0.05)',
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center'
            }}>
              <div>
                <h3 style={{ margin: 0, color: '#34495e' }}>{donor.firstName} {donor.lastName}</h3>
                <p style={{ margin: '5px 0', color: '#7f8c8d' }}>📍 {donor.city} | Blood Group: <strong>{donor.bloodType}</strong></p>
              </div>
              
              <div style={{ textAlign: 'right' }}>
                <div style={{ fontSize: '1.5rem', fontWeight: 'bold', color: donor.matchScore >= 100 ? '#27ae60' : '#2c3e50' }}>
                  {donor.matchScore}%
                </div>
                <div style={{ fontSize: '0.8rem', color: '#95a5a6', textTransform: 'uppercase' }}>Match Score</div>
              </div>
            </div>
          ))}
        </div>

      </div>
    </div>
  );
}

export default App;