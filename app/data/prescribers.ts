// Prescriber database for Kunle Ara Pharmacy
// All prescription drugs must have a valid prescriber ID

export interface Prescriber {
  id: string
  name: string
  specialty: string
  licenseNumber: string
  phone: string
  email?: string
  hospital?: string
  isActive: boolean
  registrationDate: Date
}

export const prescribers: Prescriber[] = [
  {
    id: 'PR00001',
    name: 'Dr. Adebayo Ogundimu',
    specialty: 'General Medicine',
    licenseNumber: 'MED/2018/001',
    phone: '+234-803-123-4567',
    email: 'dr.ogundimu@uch.edu.ng',
    hospital: 'University College Hospital (UCH)',
    isActive: true,
    registrationDate: new Date('2018-01-15')
  },
  {
    id: 'PR00002', 
    name: 'Dr. Fatima Mohammed',
    specialty: 'Pediatrics',
    licenseNumber: 'MED/2019/045',
    phone: '+234-805-987-6543',
    email: 'dr.fatima@gmail.com',
    hospital: 'State Hospital Ibadan',
    isActive: true,
    registrationDate: new Date('2019-03-22')
  },
  {
    id: 'PR00003',
    name: 'Dr. Chukwuma Okeke',
    specialty: 'Internal Medicine',
    licenseNumber: 'MED/2020/078',
    phone: '+234-807-456-7890',
    email: 'dr.okeke@yahoo.com',
    hospital: 'Ring Road General Hospital',
    isActive: true,
    registrationDate: new Date('2020-06-10')
  },
  {
    id: 'PR00004',
    name: 'Dr. Aisha Balogun',
    specialty: 'Cardiology',
    licenseNumber: 'MED/2017/032',
    phone: '+234-809-234-5678',
    email: 'dr.balogun@hotmail.com',
    hospital: 'University College Hospital (UCH)',
    isActive: true,
    registrationDate: new Date('2017-09-05')
  },
  {
    id: 'PR00005',
    name: 'Dr. Emmanuel Adeleke',
    specialty: 'Surgery',
    licenseNumber: 'MED/2021/101',
    phone: '+234-811-345-6789',
    email: 'dr.adeleke@gmail.com',
    hospital: 'Adeoyo Maternity Hospital',
    isActive: true,
    registrationDate: new Date('2021-02-18')
  },
  {
    id: 'PR00006',
    name: 'Dr. Ngozi Okafor',
    specialty: 'Obstetrics & Gynecology',
    licenseNumber: 'MED/2016/089',
    phone: '+234-813-567-8901',
    email: 'dr.ngozi@outlook.com',
    hospital: 'Jericho Nursing Home',
    isActive: true,
    registrationDate: new Date('2016-11-12')
  },
  {
    id: 'PR00007',
    name: 'Dr. Yakubu Hassan',
    specialty: 'Orthopedics',
    licenseNumber: 'MED/2022/156',
    phone: '+234-815-678-9012',
    email: 'dr.hassan@gmail.com',
    hospital: 'Ring Road General Hospital',
    isActive: true,
    registrationDate: new Date('2022-04-30')
  },
  {
    id: 'PR00008',
    name: 'Dr. Folake Adeyemi',
    specialty: 'Dermatology',
    licenseNumber: 'MED/2019/067',
    phone: '+234-817-789-0123',
    email: 'dr.folake@yahoo.com',
    hospital: 'Private Practice - Bodija',
    isActive: true,
    registrationDate: new Date('2019-07-14')
  },
  {
    id: 'PR00009',
    name: 'Dr. Ibrahim Musa',
    specialty: 'Psychiatry',
    licenseNumber: 'MED/2018/124',
    phone: '+234-819-890-1234',
    email: 'dr.ibrahim@hotmail.com',
    hospital: 'Neuropsychiatric Hospital Aro',
    isActive: true,
    registrationDate: new Date('2018-12-03')
  },
  {
    id: 'PR00010',
    name: 'Dr. Grace Olusegun',
    specialty: 'Family Medicine',
    licenseNumber: 'MED/2020/203',
    phone: '+234-821-012-3456',
    email: 'dr.grace@gmail.com',
    hospital: 'Yemetu Health Center',
    isActive: true,
    registrationDate: new Date('2020-08-25')
  }
]

// Prescriber validation functions
export const validatePrescriber = (prescriberId: string): boolean => {
  // Check format: must start with PR followed by 5 digits
  const prescriberRegex = /^PR\d{5}$/
  if (!prescriberRegex.test(prescriberId)) {
    return false
  }
  
  // Check if prescriber exists in database
  return prescribers.some(p => p.id === prescriberId && p.isActive)
}

export const getPrescriber = (prescriberId: string): Prescriber | null => {
  return prescribers.find(p => p.id === prescriberId) || null
}

export const getActivePrescribers = (): Prescriber[] => {
  return prescribers.filter(p => p.isActive)
}

export const getPrescribersBySpecialty = (specialty: string): Prescriber[] => {
  return prescribers.filter(p => p.specialty === specialty && p.isActive)
}

export const getPrescribersByHospital = (hospital: string): Prescriber[] => {
  return prescribers.filter(p => p.hospital === hospital && p.isActive)
}
