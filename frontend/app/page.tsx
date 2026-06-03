"use client";

import { useState } from 'react';

export default function TreasuryDashboard() {
  const [amount, setAmount] = useState('');

  const handleRebalance = () => {
    alert(`Rebalancing treasury with ${amount} (demo)`);
  };

  return (
    <div className="max-w-md mx-auto mt-10 p-8 border rounded-3xl">
      <h1 className="text-3xl font-bold mb-8 text-center">Institutional Treasury Manager</h1>

      <div className="space-y-4">
        <input type="text" value={amount} onChange={(e) => setAmount(e.target.value)} className="w-full p-4 border rounded-2xl" placeholder="Rebalance Amount" />
        <button onClick={handleRebalance} className="w-full bg-purple-600 hover:bg-purple-700 text-white py-4 rounded-2xl text-lg font-semibold">
          Trigger Rebalance
        </button>
      </div>
    </div>
  );
}