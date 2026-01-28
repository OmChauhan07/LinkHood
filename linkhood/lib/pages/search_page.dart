import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search items, people, events',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _ChipSection(),
          const SizedBox(height: 20),
          const _SectionHeader(title: 'Recommended near you'),
          const SizedBox(height: 12),
          const _ResultTile(
            title: 'Bookshelf',
            subtitle: 'Furniture • 0.6 km away',
            icon: Icons.chair_outlined,
          ),
          const _ResultTile(
            title: 'Study group',
            subtitle: 'Event • Tonight 6:00 PM',
            icon: Icons.groups_outlined,
          ),
          const _ResultTile(
            title: 'Delivery help',
            subtitle: 'Request • 1.1 km away',
            icon: Icons.local_shipping_outlined,
          ),
        ],
      ),
    );
  }
}

class _ChipSection extends StatelessWidget {
  const _ChipSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: const [
        _FilterChip(label: 'Items'),
        _FilterChip(label: 'Requests'),
        _FilterChip(label: 'People'),
        _FilterChip(label: 'Events'),
        _FilterChip(label: 'Nearby'),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      side: const BorderSide(color: Color(0xFFE5E7EB)),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Color(0xFF2C3E50),
      ),
    );
  }
}

class _ResultTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _ResultTile({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFF0EEFF),
            child: Icon(icon, color: const Color(0xFF6C63FF)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7F8C8D),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFFB0B7C3)),
        ],
      ),
    );
  }
}
