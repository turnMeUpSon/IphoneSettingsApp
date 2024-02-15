import SwiftUI

struct ContentView: View {
    //@State private var selectedTimeIndex = 0
    //@State private var notificationsEnabled = true
    @State private var is_on_airplane_mode = false
    @State private var is_wifi_on = false
    @State private var is_bluetooth_on = false
    @State private var is_mobile_service_on = false
    @State private var is_mobile_data_on = false
    @State private var is_roaming_on = false
    @State private var is_personal_hotspot_on = false
    @State private var is_vpn_on = false
    @State private var notifications_enabled = false
    @State private var selected_wifi_network_index = 0
    @State private var selected_bluetooth_network_index = 0
    @State private var selected_mobile_data_network_index = 0
    @State private var selected_roaming_options_index = 0
    @State private var selected_reminder_options = 0
    
    var available_networks = ["Home Wi-Fi", "Office Wi-Fi", "Guest Wi-Fi"]
    var available_devices = ["AirPods", "JBL TUNE13CV", "Marshall"]
    var available_mobile_data_networks = ["1", "2", "3"]
    var roaming_options = ["Internal", "External"]
    var reminder_options = ["5 min", "10 min", "15 min"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Toggle(isOn: $is_on_airplane_mode) {
                        HStack {
                            Image(systemName: "airplane")
                            Text("Airplane Mode").foregroundColor(is_on_airplane_mode ? Color.orange : Color.black)
                        }
                    }
                    
                    Toggle(isOn: $is_wifi_on) {
                        HStack {
                            Image(systemName: is_wifi_on ? "wifi" : "wifi.slash")
                            Text("Wi-Fi").foregroundColor(is_wifi_on ? Color.blue : Color.black)
                        }
                    }
                    
                    if is_wifi_on {
                        Picker("Choose a network", selection: $selected_wifi_network_index) {
                            ForEach(available_networks.indices, id: \.self) { index in
                                Text(self.available_networks[index])
                            }
                        }
                    }
                    
                    Toggle(isOn: $is_bluetooth_on) {
                        Text("Bluetooth").foregroundColor(is_bluetooth_on ? Color.blue : Color.black)
                    }
                    
                    if is_bluetooth_on {
                        Picker("Choose a device", selection: $selected_bluetooth_network_index) {
                            ForEach(available_networks.indices, id: \.self) { index in
                                Text(self.available_devices[index])
                            }
                        }
                    }
                    
                    
                    Toggle(isOn: $is_mobile_service_on) {
                        Text("Mobile Service").foregroundColor(is_mobile_service_on ? Color.green : Color.black)
                    }
                    
                    if is_mobile_service_on {
                        Toggle(isOn: $is_mobile_data_on) {
                            Text("Mobile Data")
                        }
                        
                        Picker("Network selection", selection: $selected_mobile_data_network_index) {
                            ForEach(available_mobile_data_networks.indices, id: \.self) { index in
                                Text(self.available_mobile_data_networks[index])
                            }
                        }
                        
                        Toggle(isOn: $is_personal_hotspot_on) {
                            Text("Personal Hotspot")
                        }
                        
                        Toggle(isOn: $is_roaming_on) {
                            Text("Roaming")
                        }
                        
                        if is_roaming_on {
                                Picker("Select roaming options", selection: $selected_roaming_options_index) {
                                    ForEach(roaming_options.indices, id: \.self) { index in
                                        Text(self.roaming_options[index])
                                    }
                                }
                        }
                    }
                    
                    Toggle(isOn: $is_vpn_on) {
                        Text("VPN").foregroundColor(is_vpn_on ? Color.indigo : Color.black)
                    }
                    
                }

                Section(header: Text("Notification Preferences")) {
                    Toggle(isOn: $notifications_enabled) {
                        Text("Enable Notifications")
                    }
                    
                    if notifications_enabled {
                        Picker("Select reminder interval", selection: $selected_reminder_options) {
                            ForEach(reminder_options.indices, id: \.self) { index in
                                Text(self.reminder_options[index])
                            }
                        }
                    }
                }
                
                Section(header: Text("Account")) {
                                    Text("Sign In")
                                }

                                Section(header: Text("Privacy")) {
                                    Text("Manage Data")
                                }

                
                Section(header: Text("About")) {
                    Text("Version 1.0.0")
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

