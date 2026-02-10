'use client'

import { useState } from 'react'

interface PrescriptionData {
  id: string
  patientName: string
  medication: string
  dosage: string
  verified: boolean
  pharmacistId?: string
  verifiedAt?: Date
}

interface StaffMember {
  id: string
  name: string
  license_number: string
  role: 'pharmacist' | 'technician'
}

export default function PrescriptionVerificationComponent() {
  const [showVerificationModal, setShowVerificationModal] = useState(false)
  const [selectedPrescription, setSelectedPrescription] = useState<PrescriptionData | null>(null)
  const [prescriptionData, setPrescriptionData] = useState<PrescriptionData[]>([
    // Sample data
    {
      id: 'RX001',
      patientName: 'John Doe',
      medication: 'Amoxicillin 500mg',
      dosage: 'Take 1 capsule 3 times daily',
      verified: false
    },
    {
      id: 'RX002', 
      patientName: 'Jane Smith',
      medication: 'Paracetamol 500mg',
      dosage: 'Take 2 tablets every 6 hours',
      verified: true
    }
  ])

  // Mock current staff data
  const currentStaff: StaffMember = {
    id: 'STAFF001',
    name: 'Dr. Adebayo Kunle',
    license_number: 'PCN/12345',
    role: 'pharmacist'
  }

  const handlePrescriptionVerification = (approved: boolean) => {
    if (!selectedPrescription) return

    if (approved) {
      // Update prescription as verified
      setPrescriptionData(prev => 
        prev.map(p => 
          p.id === selectedPrescription.id 
            ? { 
                ...p, 
                verified: true, 
                pharmacistId: currentStaff.id,
                verifiedAt: new Date() 
              }
            : p
        )
      )
    }

    // Close modal
    setShowVerificationModal(false)
    setSelectedPrescription(null)
  }

  const openVerificationModal = (prescription: PrescriptionData) => {
    setSelectedPrescription(prescription)
    setShowVerificationModal(true)
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">
            Prescription Verification System
          </h1>
          <p className="text-gray-600">
            Verify and dispense prescription medications - Kunle Ara Pharmacy
          </p>
        </div>

        {/* Summary Cards */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
            <div className="flex items-center">
              <div className="bg-blue-500 p-3 rounded-full">
                <span className="text-white text-xl">💊</span>
              </div>
              <div className="ml-4">
                <p className="text-sm font-medium text-blue-600">Total Prescriptions</p>
                <p className="text-2xl font-bold text-blue-900">{prescriptionData.length}</p>
              </div>
            </div>
          </div>

          <div className="bg-green-50 border border-green-200 rounded-lg p-4">
            <div className="flex items-center">
              <div className="bg-green-500 p-3 rounded-full">
                <span className="text-white text-xl">✅</span>
              </div>
              <div className="ml-4">
                <p className="text-sm font-medium text-green-600">Verified</p>
                <p className="text-2xl font-bold text-green-900">
                  {prescriptionData.filter(p => p.verified).length}
                </p>
              </div>
            </div>
          </div>

          <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
            <div className="flex items-center">
              <div className="bg-yellow-500 p-3 rounded-full">
                <span className="text-white text-xl">⏳</span>
              </div>
              <div className="ml-4">
                <p className="text-sm font-medium text-yellow-600">Pending</p>
                <p className="text-2xl font-bold text-yellow-900">
                  {prescriptionData.filter(p => !p.verified).length}
                </p>
              </div>
            </div>
          </div>

          <div className="bg-purple-50 border border-purple-200 rounded-lg p-4">
            <div className="flex items-center">
              <div className="bg-purple-500 p-3 rounded-full">
                <span className="text-white text-xl">👨‍⚕️</span>
              </div>
              <div className="ml-4">
                <p className="text-sm font-medium text-purple-600">On Duty</p>
                <p className="text-lg font-bold text-purple-900">{currentStaff.name}</p>
              </div>
            </div>
          </div>
        </div>

        {/* Prescriptions List */}
        <div className="bg-white rounded-lg shadow-md overflow-hidden">
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-xl font-semibold text-gray-900">
              Prescription Queue
            </h2>
          </div>

          <div className="divide-y divide-gray-200">
            {prescriptionData.map((prescription) => (
              <div key={prescription.id} className="px-6 py-4 hover:bg-gray-50">
                <div className="flex items-center justify-between">
                  <div className="flex-1">
                    <div className="flex items-center space-x-4">
                      <div className={`w-3 h-3 rounded-full ${
                        prescription.verified ? 'bg-green-500' : 'bg-yellow-500'
                      }`}></div>
                      
                      <div>
                        <h3 className="text-lg font-medium text-gray-900">
                          {prescription.patientName}
                        </h3>
                        <p className="text-sm text-gray-600">
                          Prescription ID: {prescription.id}
                        </p>
                      </div>
                    </div>

                    <div className="mt-2 ml-7">
                      <p className="text-sm font-medium text-gray-700">
                        📋 {prescription.medication}
                      </p>
                      <p className="text-sm text-gray-600">
                        💉 {prescription.dosage}
                      </p>
                    </div>
                  </div>

                  <div className="flex items-center space-x-3">
                    {prescription.verified ? (
                      <div className="flex items-center space-x-2">
                        <span className="bg-green-100 text-green-800 text-sm font-medium px-3 py-1 rounded-full">
                          ✅ Verified
                        </span>
                        <button className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">
                          🏪 Dispense
                        </button>
                      </div>
                    ) : (
                      <button
                        onClick={() => openVerificationModal(prescription)}
                        className="bg-yellow-600 text-white px-4 py-2 rounded-lg hover:bg-yellow-700 font-medium"
                      >
                        🔍 Verify Prescription
                      </button>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Verification Modal */}
        {showVerificationModal && selectedPrescription && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div className="bg-white rounded-lg p-6 w-full max-w-md mx-4">
              <div className="text-center mb-6">
                <div className="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center mx-auto mb-4">
                  <span className="text-2xl">🔍</span>
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-2">
                  Verify Prescription
                </h3>
                <p className="text-gray-600">
                  Review prescription details before dispensing
                </p>
              </div>

              {/* Prescription Details */}
              <div className="bg-gray-50 rounded-lg p-4 mb-6">
                <div className="space-y-3">
                  <div>
                    <span className="text-sm font-medium text-gray-600">Patient:</span>
                    <p className="font-semibold">{selectedPrescription.patientName}</p>
                  </div>
                  <div>
                    <span className="text-sm font-medium text-gray-600">Medication:</span>
                    <p className="font-semibold text-blue-600">{selectedPrescription.medication}</p>
                  </div>
                  <div>
                    <span className="text-sm font-medium text-gray-600">Dosage:</span>
                    <p className="text-sm">{selectedPrescription.dosage}</p>
                  </div>
                  <div>
                    <span className="text-sm font-medium text-gray-600">Prescription ID:</span>
                    <p className="text-sm font-mono">{selectedPrescription.id}</p>
                  </div>
                </div>
              </div>

              {/* Action Buttons */}
              <div className="flex space-x-3">
                <button
                  onClick={() => handlePrescriptionVerification(true)}
                  className="flex-1 bg-green-600 text-white py-3 px-6 rounded-lg hover:bg-green-700 font-semibold transition-colors"
                >
                  ✅ Verified - Dispense
                </button>
                <button
                  onClick={() => handlePrescriptionVerification(false)}
                  className="flex-1 bg-red-600 text-white py-3 px-6 rounded-lg hover:bg-red-700 font-semibold transition-colors"
                >
                  ❌ Cancel
                </button>
              </div>

              {/* Pharmacist Info */}
              <div className="mt-4 text-xs text-gray-500 text-center">
                Verified by: {currentStaff.name} ({currentStaff.license_number})
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
