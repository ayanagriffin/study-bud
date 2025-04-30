import SwiftUI

struct CharacterCard: View {
    let imageName: String
    let name: String
    let description: String
    let onTap: () -> Void
    let characterSide: String

    var body: some View {
        Button(action: onTap) {

            HStack(alignment: .center, spacing: -10) {
                if (characterSide == "left") {
                    // Avatar on the left
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)

                    // Text bubble on the right
                    VStack(alignment: .leading, spacing: 4) {
                        Text(name)
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    // Text bubble on the left
                    VStack(alignment: .leading, spacing: 4) {
                        Text(name)
                            .font(.headline)
                            .foregroundColor(.black)
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Avatar on the right
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                }

            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    CharacterCard(
        imageName: "percyIdle",
        name: "Positive Percy",
        description: "Stays positive even in the hardest times",
        onTap: {
            print("Percy tapped!")
        },
        characterSide: "left"
    )
    
    CharacterCard(
        imageName: "gentle-joey",
        name: "Positive Percy",
        description: "Stays positive even in the hardest times",
        onTap: {
            print("Percy tapped!")
        },
        characterSide: "right"
    )
}
