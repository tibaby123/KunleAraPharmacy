// app/lib/locationDetection.ts

export interface BranchConfig {
  id: string
  name: string
  location: string
  icon: string
  ipRanges: string[]
  ssidNames: string[]
  macAddressPrefixes?: string[]
}

export const branchConfigs: BranchConfig[] = [
  {
    id: 'uch',
    name: 'UCH Branch',
    location: 'University College Hospital Area',
    icon: '🏥',
    ipRanges: ['192.168.1', '10.0.1'],
    ssidNames: ['KunleAra-UCH', 'UCH-Pharmacy-WiFi'],
    macAddressPrefixes: ['00:1B:44'] // Router MAC prefix
  },
  {
    id: 'yemetu',
    name: 'Yemetu Branch', 
    location: 'Yemetu Area, Ibadan',
    icon: '🏪',
    ipRanges: ['192.168.2', '10.0.2'],
    ssidNames: ['KunleAra-Yemetu', 'Yemetu-Pharmacy-WiFi'],
    macAddressPrefixes: ['00:1B:45']
  },
  {
    id: 'ring-road',
    name: 'Ring Road Branch',
    location: 'Ring Road Area, Ibadan', 
    icon: '🏢',
    ipRanges: ['192.168.3', '10.0.3'],
    ssidNames: ['KunleAra-RingRoad', 'RingRoad-Pharmacy-WiFi'],
    macAddressPrefixes: ['00:1B:46']
  }
]

// Get user's IP address
export const getUserIP = async (): Promise<string | null> => {
  try {
    const response = await fetch('https://api.ipify.org?format=json')
    const data = await response.json()
    return data.ip
  } catch (error) {
    console.error('Failed to get IP:', error)
    return null
  }
}

// Get internal network IP (more accurate for branch detection)
export const getInternalIP = async (): Promise<string | null> => {
  return new Promise((resolve) => {
    const rtc = new RTCPeerConnection()
    rtc.createDataChannel('')
    rtc.createOffer().then((offer) => rtc.setLocalDescription(offer))
    
    rtc.onicecandidate = (event) => {
      if (event.candidate) {
        const candidate = event.candidate.candidate
        const ipMatch = candidate.match(/\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/)
        if (ipMatch) {
          resolve(ipMatch[0])
          rtc.close()
        }
      }
    }
    
    setTimeout(() => resolve(null), 3000) // 3-second timeout
  })
}

// Detect branch by IP address
export const detectBranchByIP = (ip: string): BranchConfig | null => {
  for (const branch of branchConfigs) {
    for (const range of branch.ipRanges) {
      if (ip.startsWith(range)) {
        return branch
      }
    }
  }
  return null
}

// Get available WiFi networks (requires HTTPS and user permission)
export const getWiFiNetworks = async (): Promise<string[]> => {
  try {
    // This requires the Web Network API (experimental)
    if ('navigator' in window && 'wifi' in navigator) {
      // @ts-ignore - Experimental API
      const networks = await navigator.wifi.getNetworks()
      return networks.map((network: any) => network.ssid)
    }
  } catch (error) {
    console.error('WiFi detection not supported:', error)
  }
  return []
}

// Detect branch by SSID
export const detectBranchBySSID = (availableNetworks: string[]): BranchConfig | null => {
  for (const branch of branchConfigs) {
    for (const ssid of branch.ssidNames) {
      if (availableNetworks.includes(ssid)) {
        return branch
      }
    }
  }
  return null
}

// Main location detection function
export const detectBranchLocation = async (): Promise<BranchConfig | null> => {
  // Method 1: Try internal IP detection (most reliable)
  const internalIP = await getInternalIP()
  if (internalIP) {
    const branchByIP = detectBranchByIP(internalIP)
    if (branchByIP) {
      console.log('Branch detected by internal IP:', branchByIP.name)
      return branchByIP
    }
  }

  // Method 2: Try WiFi SSID detection
  const wifiNetworks = await getWiFiNetworks()
  if (wifiNetworks.length > 0) {
    const branchBySSID = detectBranchBySSID(wifiNetworks)
    if (branchBySSID) {
      console.log('Branch detected by WiFi SSID:', branchBySSID.name)
      return branchBySSID
    }
  }

  // Method 3: Fallback to external IP (less reliable)
  const externalIP = await getUserIP()
  if (externalIP) {
    // You would need to map external IPs to branches
    // This requires knowing each branch's public IP address
  }

  console.log('No branch detected automatically')
  return null
}

// Simulate location detection for development
export const simulateLocationDetection = async (): Promise<BranchConfig | null> => {
  // For testing purposes, randomly select a branch
  await new Promise(resolve => setTimeout(resolve, 2000)) // 2-second delay
  
  const randomIndex = Math.floor(Math.random() * branchConfigs.length)
  return branchConfigs[randomIndex]
}
