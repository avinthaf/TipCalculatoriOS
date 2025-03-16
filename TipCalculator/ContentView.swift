import SwiftUI

struct ContentView: View {
    @State private var billAmount: String = ""
    @State private var tipPercentage: Double = 15.0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tip Calculator")
                .font(.largeTitle)
                .padding()
            
            // Bill Amount Input
            TextField("Enter bill amount", text: $billAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            // Tip Percentage Slider
            HStack {
                Text("Tip Percentage:")
                Slider(value: $tipPercentage, in: 0...30, step: 1)
                Text("\(Int(tipPercentage))%")
            }
            .padding()
            
            // Calculate and Display Total
            let (bill, tip) = calculateBillAndTip()
            let total = bill + tip
            
            VStack(spacing: 16) {
                Text("Tip Amount: \(tip, specifier: "%.2f")").font(.title2)
                
                Text("Total: \(total, specifier: "%.2f")")
                    .font(.title)
            }
            
            Spacer()
        }
        .padding()
    }
    
    // Function to calculate the total bill including tip
    private func calculateBillAndTip() -> (bill: Double, tip: Double) {
        let bill = Double(billAmount) ?? 0
        let tip = bill * (tipPercentage / 100)
        return (bill, tip)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
